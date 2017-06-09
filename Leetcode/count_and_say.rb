# encoding:utf-8
# @param {Integer} n
# @return {String}
def count_and_say(n)
    str = n.to_s; result = String.new; flag = nil

    return "1" if str == "1"
    0.upto(str.size - 1).each do |n|
        next if n == flag
            
        if str[n] == "1" && str[n + 1] == "2"
            result << "11"
        end

        if str[n] == "1" && str[n + 1] == "1"
            result << "21"
            flag = n + 1; n = flag; next
        end

        if str[n] == "2" && str[n + 1] == "1"
            result << "1221"
            flag = n + 1; n = flag; next
        end

        if n == str.size - 1
            result << "11"
        end
    end

    result
end
