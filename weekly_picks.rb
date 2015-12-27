require 'mechanize'
require 'nokogiri'

mechanize = Mechanize.new

page = mechanize.get("https://www.westgatedestinations.com/nevada/las-vegas/westgate-las-vegas-hotel-casino/casino/supercontest-selections")

table = page.search("//table[@class='table table-striped table-bordered']").first.children
picks_array = []
table.each do |element|
  temp_array = []
  if element.class == Nokogiri::XML::Element
    element.children.each do |child|
      temp_array << child.children.first.text unless child.children.first.nil?
    end
    picks_array << temp_array
  end
end

picks_array = picks_array.select { |picks| picks.length == 6 }
