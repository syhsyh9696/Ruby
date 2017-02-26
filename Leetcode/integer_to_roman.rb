# encoding:utf-8
# @param {Integer} num
# @return {String}
def int_to_roman(num)
    thousand = ['', 'M', 'MM', 'MMM']
    hundred = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
    ten = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
    one = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX']

    result = ""
    num, rem = num.divmod(1000); result << thousand[num]
    num, rem = rem.divmod(100); result << hundred[num]
    num, rem = rem.divmod(10); result << ten[num]
    result << one[rem]
    result
end
