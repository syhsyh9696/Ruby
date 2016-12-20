# encoding: utf-8
require 'open-uri'

base_url = 'http://7xqh4i.com1.z0.glb.clouddn.com/pic'

331.times do |i|
    if i == 0
        next
    end
    fn = "#{i.to_s}.jpg"
    p fn
    url = base_url + "#{i.to_s}.jpg"

    open(url) do |io|
        f = File.new(fn, "w")
        if f
            f.write(io.read)
        else
            p "Open file error"
        end
        f.close()
    end
end
