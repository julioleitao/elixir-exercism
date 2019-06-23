def slices(series, length):
    valid_input(series, length)
    
    output, index = [], 0
    while index + length - 1 < len(series):
        output.append(series[index:index + length])
        index += 1

    return output

def valid_input(series, length):
    if length <= 0 or length > len(series):
        raise ValueError("Length not valid for this serie")
