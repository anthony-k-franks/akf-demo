require 'date'
require 'net/http'
require 'nokogiri'
require 'open-uri'

class ComicController < ApplicationController
  
  def rand_comic(selected_comic)
    b = ButtersafeController.new
    c = CyanideController.new
    d = DilbertController.new
    w = WelcomeController.new
    if selected_comic == 1
        @comic_hash = b.index
        @comic_hash['comic'] = 'Buttersafe'
    elsif selected_comic == 2
        @comic_hash = c.index
        @comic_hash['comic'] = 'Cyanide and Happiness'
    elsif selected_comic == 3
        @comic_hash = d.dilbert
        @comic_hash['comic'] = 'Dilbert'
    elsif selected_comic == 4
        @comic_hash = w.index
        @comic_hash['comic'] = 'XKCD'
    end
    return @comic_hash
  end

  def index
      rand_no = Random.new.rand(1..4)
      rand_comic(rand_no)
  end
end
