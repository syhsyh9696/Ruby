# encoding:utf-8
# @param {String} num1
# @param {String} num2
# @return {String}
# @param {String} num1
# @param {String} num2
# @return {String}
def multiply(num1, num2)
    n1, n2 = num1.chars.map(&:to_i), num2.chars.map(&:to_i)
    m, n = n1.size, n2.size
    mul = Array.new(m + n, 0)
    (0...m).each do |i|
        (0...n).each do |j|
            a, b = (n1[i] * n2[j]).divmod(10)
            mul[i + j + 1] += b
            mul[i + j] += a
        end
    end
    (mul.size - 1).downto(1) do |i|
        a, b = mul[i].divmod 10
        mul[i] = b
        mul[i - 1] += a
    end
    res = mul.join.to_s.gsub(/^0+/, '')
    res.empty? ? '0' : res
end
