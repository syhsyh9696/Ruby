# encoding:utf-8
# @param {Integer} n
# @return {String}
def count_and_say(n)
    return '1' if n == 1

    str = '1'; n -= 1
    n.times do
        char, count, newstr = str[0], 1, newstr = ''
        str[1..-1].each_char do |ch|
            if char == ch
                count += 1
            else
                newstr << count.to_s << char
                char = ch
                count = 1
            end
        end
        newstr << count.to_s << char
        str = newstr
    end

    str
end
