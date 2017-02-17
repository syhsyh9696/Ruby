# encoding: utf-8
# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
    str = x.to_s
    return true if str == str.reverse
    false
end
