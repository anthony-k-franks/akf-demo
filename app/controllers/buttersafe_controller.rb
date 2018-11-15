require 'date'
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ButtersafeController < ApplicationController
  
  def get_comic

    #Build link to retrieve comice
    uri = URI("http://buttersafe.com/?randomcomic")
    rst = Net::HTTP.get(uri)

    #print rst

    doc = Nokogiri::HTML.parse(open(uri))

    tags = doc.xpath("//div[contains(@id,'comic')]//img")

    #Link to img, which is the comic
    img_uri = tags.map { |t| t[:src]}[0]
    #Comic Title
    comic_title = tags.map { |t| t[:alt]}[0]

    @comic_hash = Hash.new
    @comic_hash['title'] = comic_title
    @comic_hash['link'] = img_uri
    #The comic
    @comic_hash['img'] = img_uri

    return @comic_hash

  end
  def index
    return get_comic
  end
end
