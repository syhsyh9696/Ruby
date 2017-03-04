# encoding:utf-8
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    ar = []
    ar[2] = ['a', 'b', 'c']
    ar[3] = ['d', 'e', 'f']
    ar[4] = ['g', 'h', 'i']
    ar[5] = ['j', 'k', 'l']
    ar[6] = ['m', 'n', 'o']
    ar[7] = ['p', 'q', 'r', 's']
    ar[8] = ['t', 'u', 'v']
    ar[9] = ['w', 'x', 'y', 'z']

    return [] if digits.size == 0
    return ar[digits.to_i] if digits.size == 1

    letters = []
    digits.chars.each do |i|
        letters << ar[i.to_i]
    end
    letters.reduce(&:product).map(&:join)
end
