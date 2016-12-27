# encoding: utf-8
# @param {String} s
# @return {String}

def longest_palindrome(s)
    substr, maxlen  = '', 0
    
    s.each_char do |ch|
        if substr.include?(ch)
            substr = substr[substr.index(ch)..-1] + ch
            maxlen = substr.length if maxlen < substr.length
        else
            substr << ch
        end

    end

    substr
end
