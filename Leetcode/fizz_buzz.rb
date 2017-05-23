# encoding:utf-8

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
    result = Array.new
    1.upto(n).each do |i|
        if i % 5 == 0 && i % 3 == 0
            result.push "FizzBuzz"
        elsif i % 3 == 0
            result.push << "Fizz"
        elsif i % 5 == 0
            result.push "Buzz"
        elsif
            result.push i.to_s
        end
    end
    result
end
