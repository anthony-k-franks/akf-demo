require 'date'
require 'net/http'
require 'nokogiri'
require 'open-uri'

class DilbertController < ApplicationController
 
  def get_comic

    #Create a random date and retry until it's valid
    rand_no = Random.new
    rand_date = nil
    #Beginning date for dilbert
    #http://dilbert.com/strip/1989-04-16
    #Calculate Today's date
    today = Date.today
    y = rand_no.rand(1989..today.year)
    m = rand_no.rand(01..today.month)
    d = rand_no.rand(01..today.day)

    #print "y: #{y}\n"
    #print "m: #{m}\n"
    #print "d: #{d}\n"
    #rand_date = Date.parse("#{y}-#{m}-#{d}")

    while not rand_date
        begin
            rand_date = Date.parse("#{y}-#{m}-#{d}")
        rescue ArgumentError => e
            puts "Rescued: #{rand_date}"
        end
    end

    #For testing
    #print "rand_date: #{rand_date}\n"

    #Build link to retrieve comice
    uri = URI("http://dilbert.com/strip/#{rand_date}")
    #For testing
    #uri = URI("http://dilbert.com/strip/2018-01-01")
    rst = Net::HTTP.get(uri)

    #print rst

    doc = Nokogiri::HTML.parse(open(uri))

    tags = doc.xpath("//img[contains(@class,'img-responsive img-comic')]")

    #Link to img, which is the comic
    img_uri = tags.map { |t| t[:src]}[0]

    #Comic Title
    comic_title = doc.xpath("//span[contains(@class,'comic-title-name')]")

    @comic_hash = Hash.new
    @comic_hash['title'] = comic_title.text
    @comic_hash['date'] = rand_date
    @comic_hash['link'] = uri
    @comic_hash['img'] = img_uri

    return @comic_hash
    #puts
    #puts "The date is:"
    #puts rand_date
    #puts "The title is:"
    #puts comic_title.text
    #puts
    #puts img_uri
    #puts
  end

  def dilbert
    get_comic
  end

end
