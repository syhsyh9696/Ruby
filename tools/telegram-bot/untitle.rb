# encoding: utf-8
require 'open-uri'

base_url = "http://172.16.224.67/jwglxt/kbcx/xskbcx_cxXsShcPdf.html?xnm=2016&xqm=3&xszd.sj=true&xszd.cd=true&xszd.js=true&xszd.jszc=false&xszd.jxb=false&xnmc=2016-2017&xqmmc=1&xm=%25E5%25AD%2599%25E5%2585%2583%25E6%25B5%25A9&jgmc=undefined&xxdm=&xh=20141222124&xh_id=20141222124&gnmkdmKey=N253508&sessionUserKey=20141222124"

open(base_url) do |io|
    f = File.open("temp.pdf", "w")
    if f
        f.write(io.read)
    else
        p error
    end
end
