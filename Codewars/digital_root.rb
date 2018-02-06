# encoding:utf-8

def digital_root(n)
    str = n.to_s; sum = 0    
    str.each_char do |e|
        sum += e.to_i
    end

    sum = digital_root(sum) if sum >= 10
    sum
end

def digital_root(n)
    n < 10 ? n : digital_root(n / 10 + n % 10)
end
