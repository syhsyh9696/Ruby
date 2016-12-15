# encoding: utf-8

def InputPoints()
    p "输入坐标数"
    num = gets.to_i
    array = Array.new
    p "输入各点的坐标"
    for i in 0..(num - 1)
        temp = Array.new
        p "x[#{i}]"
        temp[0] = gets.to_i
        p "y[#{i}]"
        temp[1] = gets.to_i
        p "输入点类别"
        temp[2] = gets.to_i
        if temp[2] == -1
            temp[0] = -temp[0]
            temp[1] = -temp[1]
        end
        array << temp
    end
    p array
    return array
end

def add(point, w)
    return (point[0] * w[0] +point[1] * w[1] + point[2] * w[2])
end

def changew(w, array, p)
    w[0] = w[0] + p * array[0]
    w[1] = w[1] + p * array[1]
    w[2] = w[2] + p * array[2]
    return w[0] + w[1] + w[2]
end

p = 1
w = [1, 1, 1]
point = InputPoints()
judge = Array.new()

point.each do |e|
    if add(e, w) > 0
        judge << true
        next
    else
        changew(w, e, p)
        judge << false
    end
end

if judge.all?{ |e| e == true }
    p "找到了W"
    p "W[0]:#{w[0]} W[1]:#{w[1]} W[2]:#{w[2]}"
else
    while !judge.all?{|e| e == true }
        judge.clear
        point.each do |e|
            if add(e, w) > 0
                judge << true
                next
            else
                changew(w, e, p)
                judge << false
            end
        end
    end
    p "找到了W"
    p "W[0]:#{w[0]} W[1]:#{w[1]} W[2]:#{w[2]}"
end
