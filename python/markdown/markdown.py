import re

def has_header(i):
    return re.match('#(.*)', i)

def parse_headers(line):
    headers = ["#", "##", "######"]
    for header in headers:
        if re.match('{} (.*)'.format(header), line):
            return content_between_tags(line[len(header) + 1:], "h{}".format(len(header)))

def content_between_tags(content, tag):
    return "<{}>{}</{}>".format(tag, content, tag)

def apply_with(match, tag):
    return '{}<{}>{}</{}>{}'.format(match.group(1), tag, match.group(2), tag, match.group(3))

def apply_em(match):
    return apply_with(match, "em")

def apply_strong(match):
    return apply_with(match, "strong")

def match(regex, content):
    return re.match(regex, content)

def is_strong(content):
    return match('(.*)__(.*)__(.*)', content)

def is_italic(content):
    return match('(.*)_(.*)_(.*)', content)

def if_apply(content, fn_condition, fn_apply):
    m = fn_condition(content)
    if m:
        return fn_apply(m)
    return content


def apply_styles(match):
    curr = if_apply(match, is_strong, apply_strong)
    return if_apply(curr, is_italic, apply_em)  

class Markdown:
    def __init__(self, content):
        self.in_list = False
        self.in_list_append = False
        self.lines = content.split("\n")
        self.result = ''
    
    def add(self, content):
        self.result += content

# remove duplicated/nplicated code
# apply clean and pure functions
# refactored not necessary logic
# it is not a rewrite of the solution.
# NOTE not necessary for this exercise purpose, but good:
# change the logic below with more OO.
def parse(markdown):
    markdown = Markdown(markdown)

    for line in markdown.lines:
        if has_header(line):
            line = parse_headers(line)
        m = re.match(r'\* (.*)', line)
        if m:
            curr = apply_styles(m.group(1))
            prefix = ''
            if not markdown.in_list:
                markdown.in_list = True
                prefix = '<ul>'
            line = prefix + content_between_tags(curr, "li")
        else:
            if markdown.in_list:
                markdown.in_list_append = True
                markdown.in_list = False

        if not re.match('<h|<ul|<p|<li', line):
            line = content_between_tags(line, "p")

        line = apply_styles(line)

        if markdown.in_list_append:
            line = '</ul>' + line
            markdown.in_list_append = False
        markdown.add(line)

    if markdown.in_list:
        markdown.add('</ul>')

    return markdown.result
