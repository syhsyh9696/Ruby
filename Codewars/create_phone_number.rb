# encoding:utf-8

def createPhoneNumber(numbers)
    str = '('
    num = numbers.each_slice(3).to_a
    str << num[0].join << ') ' << num[1].join << "-" << num[2].join << num[-1].join    
end

def createPhoneNumber(numbers)
    "(%d%d%d) %d%d%d-%d%d%d%d" % numbers
end
