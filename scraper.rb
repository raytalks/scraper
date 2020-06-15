require 'HTTParty'
require 'Nokogiri'
require 'pry'

class Scraper
  attr_accessor :parse_page

  def initialize
   doc = HTTParty.get("https://amsrb.org/")
   @parse_page = Nokogiri::HTML(doc)
  end

  @parse_page.css(".meetup").css(".content").css("p").children.map { |meetup| meetup.text }.compact
end

