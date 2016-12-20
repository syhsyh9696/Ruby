# encoding: utf-8

require_relative "moduleApollo"
class Profile
    include Apollo
    attr_reader :name, :number
    @@f_base_url = "http://172.16.224.67/jwglxt/kbcx/xskbcx_cxXsShcPdf.html?xnm=2016&xqm=3&xszd.sj=true&xszd.cd=true&xszd.js=true&xszd.jszc=false&xszd.jxb=false&xnmc=2016-2017&xqmmc=1&xm="
    @@m_base_url = "&jgmc=undefined&xxdm=&xh="

    def initialize(number = nil, name = nil)
        @name = name
        @number = number
    end

    def personalURL()
        uri = @@f_base_url + nameuri(self.name) + @@m_base_url + "#{self.number}&xh_id=#{self.number}&gnmkdmKey=N253508&sessionUserKey=#{self.number}"
    end
end
