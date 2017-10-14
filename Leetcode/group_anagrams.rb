# encoding:utf-8
# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
    strs.group_by{ |x| x.chars.sort }.values.map(&:sort).reverse
end
