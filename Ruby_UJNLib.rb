require 'net/http'
require 'json'
require 'pp'

def getToken
    stuNum = ARGV[0].to_s
    stuPwd = ARGV[1].to_s
    if stuNum.length != 12
        p "Wrong student number!"
        return nil
    end
    temp = "http://seat.ujn.edu.cn/rest/auth?username=#{stuNum}&password=#{stuPwd}"
    url = URI(temp)
    json = Net::HTTP.get(url)
    obj = JSON.parse(json)
    p obj["status"]
end

pp getToken()
