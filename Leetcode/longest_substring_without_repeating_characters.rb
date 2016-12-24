# encoding: utf-8
# @param {String} s
# @return {Integer}

def length_of_longest_substring(s)
    substring, maxlen = '', 0

    s.each_char do |ch|
        if substring.include?(ch)
            maxlen = substring.size if maxlen < substring.length
            substring = substring[(substring.index(ch)+1)..-1]
        end
        substring << ch
    end
    maxlen = substring.length if maxlen < substring.length
end
