# encoding:utf-8

module Unicorn
    def post_request(stunum)
        params = {}
        params["yktkh"] = "2#{stunum}"
        params["password"] = "#{stunum[5..10]}"
        params["Submit"] = "%E7%99%BB%E9%99%86"
        params["towhere"] = 'ecampus'

        url = "http://auth.ujn.edu.cn/TONGYI_CHECK/yktkh/checkyktkh.asp"
        uri = URI(url)
        res = Net::HTTP.post_form(uri, params)
        return res.body
    end

    def res_process(body)
        doc = Nokogiri::HTML(body)

        details = doc.search('//form/input[@type="hidden"]/..').map do |row|
            if row.at('[@name="errcode"]')['value'] == "0"
                yktkh = row.at('[@name="yktkhusername"]')['value']
    
                name = row.at('[@name="xm"]')['value']

                bmtop = row.at('[@name="bmtop"]')['value']

                bmm = row.at('[@name="bmm"]')['value']

                return "#{yktkh} #{name} #{bmtop} #{bmm} \n"                
            else
                return ""
            end
        end
    end

    module_function :post_request
    module_function :res_process
end
