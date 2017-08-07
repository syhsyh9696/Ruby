# encoding:utf-8

require 'nokogiri'
require 'mechanize'
require 'yaml'
require 'json'
require 'pp'

# 获取配置
def configs
    config = YAML.load(File.read('config.yml'))
end

# 处理cookies
def assemble_cookies
    cookies = configs()['cookies'].split(';').collect{ |x| x.strip }
    
    cookies_hash = Hash.new
    cookies.each do |item|
        # Split key and value
        temp = item.split('=')
        
        # Add key and value into cookies_hash
        key = temp[0]; value = item.gsub(key, '').gsub('=', '')
        cookies_hash[key] = value
    end
    
    url = "http://renren.com/"

    mechanize_cookie = Mechanize::Cookie.parse(url, configs()['cookies'])
    
    pp mechanize_cookie
end
assemble_cookies

# 组装HTTP请求头
def assemble_headers()
    headers = {
        'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding' => 'gzip, deflate, sdch',
        'Accept-Language' => 'en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2,ru;q=0.2,fr;q=0.2,ja;q=0.2',
        'Cache-Control' => 'max-age=0',
        'Connection' => 'keep-alive',
        'Host' => 'www.renren.com',
        'RA-Sid' => 'DAF1BC22-20140915-034057-065a39-2cb2b1',

        'RA-Ver' => '2.10.4',
        'Referer' => 'http://www.renren.com/SysHome.do',
        'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36',
    }

    # headers['Cookie'] = configs()['token']

    headers    
end

def get_albums
    client = Mechanize.new
    url = "http://photo.renren.com/photo/844864475/album-1061834563/bypage/ajax/v7?page=1&pageSize=100"

    pp client.cookie_jar

    client.get(url, headers = assemble_headers)
    pp assemble_headers
end



def simulate_login
    client = Mechanize.new
    client.user_agent_alias = 'Windows Mozilla'
    client.get "http://www.renren.com/"

    pp client.page.forms[0]
end

