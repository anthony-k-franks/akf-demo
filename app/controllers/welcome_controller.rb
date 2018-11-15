require 'net/http'
require 'json'

class WelcomeController < ApplicationController

  def get_comic(num=2070)
      #Create new random number
      ran_no = Random.new

      #Generate random number with max of 2070
      comic_no = ran_no.rand(num)

      uri = URI("https://xkcd.com/#{comic_no}/info.0.json")
      #uri = URI("http://xkcd.com/#{comic_no}/info.0.json")
      comic_json = Net::HTTP.get(uri)
      @comic_hash = JSON.parse(comic_json)

      #Link is empty so set it to random comic URI
      @comic_hash['link'] = uri
      @comic_hash['comic_no'] = comic_no
      return @comic_hash
  end
  # GET /welcome
  def index
    return get_comic
  end

end
