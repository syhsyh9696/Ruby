# encoding:utf-8
# @param {Integer} n
# @return {String}
def count_and_say(n)
    str = n.to_s;num = str.size
    
    0.upto(num - 1) do |n|
        break if size == 1
        next if str[n] == str[n + 1]
        str.insert(n + 1, "$")
    end

    return str
end
