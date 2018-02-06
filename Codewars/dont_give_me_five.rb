# encoding:utf-8

def dont_give_me_five(start_, end_)
    array = []
    start_.upto(end_).each do |e|
        array << e if !_check_five_(e)
    end
    return array.size
end

private def _check_five_(num)
    num = -num if num < 0
    array = num.to_s.chars.map(&:to_i)
    return true if array.index(5)
    false
end
