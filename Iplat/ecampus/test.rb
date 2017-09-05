# encoding:utf-8

require 'rtesseract'
require 'mini_magick'

def identify(path="tt.png")
    image = RTesseract.new(path, processor: "mini_magick")
    image.to_s.to_i
end
p identify
