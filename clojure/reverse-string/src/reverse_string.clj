(ns reverse-string)

(defn reverse-string [string]
  (reduce #(str %2 %1) "" string))
