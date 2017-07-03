# encoding: utf-8
require 'open-uri'
require 'net/http'
require 'json'
require 'uri'
require 'cgi'

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

cookie = CGI::Cookie.new()
cookie = res.header['set-cookie']
#cookie_str = res.header['set-cookie'].split(" ")[0][11..(res.header['set-cookie'].split(" ")[0].length-2)].to_s

uritemp = URI.parse(base_url_2)
puts res.body

par_str = "xnm=2016&xqm=3&xszd.sj=true&xszd.cd=true&xszd.js=true&xszd.jszc=false&xszd.jxb=false&xnmc=2016-2017&xqmmc=1&xm=%E5%AD%99%E5%85%83%E6%B5%A9&jgmc=undefined&xxdm=&xh=20141222124&xh_id=20141222124&gnmkdmKey=N253508&sessionUserKey=20141222124"
param = CGI::parse(par_str)
p param



=begin
open(url) do |io|
    f = File.open("temp.pdf", "w")
    if f
        f.write(io.read)
    else
        p error
    end
end

base_url = "http://172.16.224.67/jwglxt/kbcx/xskbcx_cxXsShcPdf.html?xnm=2016&xqm=3&xszd.sj=true&xszd.cd=true&xszd.js=true&xszd.jszc=false&xszd.jxb=false&xnmc=2016-2017&xqmmc=1&xm=%25E5%25AD%2599%25E5%2585%2583%25E6%25B5%25A9&jgmc=undefined&xxdm=&xh=20141222124&xh_id=20141222124&gnmkdmKey=N253508&sessionUserKey=20141222124"
url = URI(base_url)

=end
