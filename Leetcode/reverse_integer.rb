#encoding: utf-8
# @param {Integer} x
# @return {Integer}
BIT = 32
MAX = 2 ** (BIT - 1) - 1
MIN = -2 ** (BIT - 1)
def reverse(x)
    new_str = x.to_s
    if new_str[0] != "-"
        return new_str.reverse.to_i if new_str.reverse.to_i < MAX
        return 0
    else
        new_num = ("-" + new_str[1..-1].reverse).to_i
        return new_num if new_num < MAX && new_num > MIN
    end
    0
end

---
BIT = 32
MAX = 2 ** (BIT - 1) - 1
MIN = -2 ** (BIT - 1)
def reverse(x)
    return -reverse(-x) if x < 0

    sum = 0
    while x > 0
        sum = sum * 10 + x % 10
        x = x / 10
    end
    sum > MAX ? 0 : sum
end
