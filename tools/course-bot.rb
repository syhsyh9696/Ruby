# encoding: utf-8

require 'uri'

text = "%25E5%25AD%2599%25E5%2585%2583%25E6%25B5%25A9"
uri = URI::decode(text)
uri = URI::decode(uri)
p uri
