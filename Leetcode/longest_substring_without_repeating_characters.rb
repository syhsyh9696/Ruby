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
    # 存在特殊情况 如果重复ch的话会导致substring里面的元素减少

    maxlen
end
