# encoding: utf-8
require 'open-uri'
require 'net/http'
require 'json'
require 'uri'

base_url_1 = "http://172.16.224.67/jwglxt/xtgl/login_cxCheckYh.html"
base_url_2 = "http://172.16.224.67/jwglxt/xtgl/init_cxGnPage.html"
params= {}
params["yhm"] = '20141222124'
params["mm"] = 'syhsyh96031500'
params["yzm"] = ''

uri = URI(base_url_1)
res = Net::HTTP.post_form(uri, params)
json = JSON.parse(res.body)
if json["status"] == "success"
    p "done!"
end

cookie = res.header['set-cookie'].split(" ")[0][0..(res.header['set-cookie'].split(" ")[0].length-2)].to_s

uritemp = URI.parse(base_url_2)
p cookie
puts res.header['set-cookie']
puts res.body

p restemp.body
