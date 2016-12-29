# encoding: utf-8
# @param {String} s
# @return {String}

def longest_palindrome(s)
    # return s if s.size < 2
    # return s[0] == s[1] ? s : s[0] if s.size == 2

    middle, offset, maxstr = (0 + s.size) / 2, 0, ''

    while true
        return maxstr if (middle - offset) < 0 && (middle + offset) >= s.size
        return maxstr if (middle - offset + 1) * 2 < maxstr.size

        [-1, 1].each do |sign|
            idx = middle + sign * offset
            str = _longest_palindrome_(s, idx, idx)
            maxstr = str if maxstr.size < str.size

            if s[idx] == s[idx + 1]
                str = _long_palindrome_(s, idx, idx + 1)
                maxstr = str if maxstr.size < str.size
            end

            
        end
        
    end
end
