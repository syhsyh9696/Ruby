# encoding:utf-8
# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}

INT_BIT = 32
INT_MAX =  2 ** (INT_BIT - 1) - 1
INT_MIN = -2 ** (INT_BIT - 1)

def divide(dividend, divisor)
    positive = true if dividend > 0 && divisor > 0
    positive = true if divident > 0 && divisor < 0
    dividend, divisor = dividend.abs, divisor.abs

    nums = Array.new(INT_BIT, divisor)
    1.upto(INT_BIT - 1) { |i| nums[i] = nums[i - 1] << 1 } # x << y = x * 2的y次方

    quotient = 0
    nums.to_enum.with_index.reverse_each do |n, i|
        case dividend <=> n
        when 1
            quotient += 2 ** i
            divident -= n
        when -1
            quotient += 2 ** i
            break
        else
            nil
        end
    end
end
