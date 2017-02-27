# encoding:utf-8
# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return '' if strs.empty?

    str, flag = strs[0], 0
    str.chars.each_with_index do |ch, idx|
        break if strs[1..-1].any? { |e| e[idx] != ch }
        flag += 1
    end
    str.slice(0, flag)
end
