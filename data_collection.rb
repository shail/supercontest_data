# Get all the weekly pics and standings to store in mysql
require 'mechanize'
require 'nokogiri'
require 'mysql2'
require 'yaml'

raise "Need to provide environment argument" if ARGV[0].nil?
environment = ARGV[0]
config = YAML::load_file("config/database.yml")[environment]
client = Mysql2::Client.new(config)

def collect_table_data(url)
  mechanize = Mechanize.new

  page = mechanize.get(url)

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
  picks_array
end

standings_data = collect_table_data("https://www.westgatedestinations.com/nevada/las-vegas/westgate-las-vegas-hotel-casino/casino/supercontest-standings")
standings_data.shift

picks_data = collect_table_data("https://www.westgatedestinations.com/nevada/las-vegas/westgate-las-vegas-hotel-casino/casino/supercontest-selections")
picks_data = picks_data.select { |picks| picks.length == 6 }
picks_data.shift
