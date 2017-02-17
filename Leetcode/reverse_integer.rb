#encoding: utf-8
# @param {Integer} x
# @return {Integer}
def reverse(x)
    new_str = x.to_s
    if new_str[0] != "-"
        return new_str.reverse.to_i if new_str.reverse.to_i < 2147483647
        return 0
    else
        new_num = ("-" + new_str[1..-1].reverse).to_i
        return new_num if new_num < 2147483647 && new_num > -2147483647
    end
    0
end
