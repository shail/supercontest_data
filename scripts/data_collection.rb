# Get all the weekly pics and standings to store in mysql
require 'mechanize'
require 'nokogiri'
require 'mysql2'
require 'yaml'

raise "Need to provide environment argument" if ARGV[0].nil?
environment = ARGV[0]
skip = ARGV[1] ? ARGV[1].split(",") : []
config = YAML::load_file("../config/database.yml")[environment]
client = Mysql2::Client.new(config)
@mechanize = Mechanize.new

def collect_table_data(url)
  page = @mechanize.get(url)

  table = page.search("//table[@class='table table-striped table-bordered']").first.children

  if url.include?("supercontest-selection")
    week = page.search("//h1").first.children.first.text.match(/\d{1,}$/)[0].to_i
  else
    week = table[1].children[1].children.text.match(/\d{1,}$/)[0].to_i
  end

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

  [picks_array, week]
end

if !skip.include?("standings")
  standings_data = collect_table_data("https://www.westgatedestinations.com/nevada/las-vegas/westgate-las-vegas-hotel-casino/casino/supercontest-standings")
  standings_data.first.shift
  puts "Inserting standings data"
  standings_data.first.each_with_index do |standing, index|
    next if index == 0 # header
    standing.first.gsub!("\"", "\\\"")
    standing.first.gsub!("'", "\\'")
    team = client.query("SELECT * FROM teams WHERE name='#{standing.first}'")

    if team.first.nil?
      client.query("INSERT INTO teams (name) values ('#{standing.first}')")
      team_id = client.last_id
    else
      team_id = team.first["id"]
    end

    weekly_pts = standing[1].to_i + 0.5 * standing[3].to_i
    total_pts = standing[8].to_i + 0.5 * standing[7].to_i
    client.query("INSERT INTO team_standings (team_id, win, loss, tie, pts) values (#{team_id}, #{standing[8].to_i}, #{standing[6].to_i}, #{standing[7].to_i}, #{total_pts})")

    client.query("INSERT INTO contest_weekly_results (week, team_id, win, loss, tie, pts) values (#{standings_data[1]}, #{team_id}, #{standing[1].to_i}, #{standing[2].to_i}, #{standing[3].to_i}, #{weekly_pts})")
  end
end

if !skip.include?("picks")
  puts "Insert picks data"
  picks_data = collect_table_data("https://www.westgatedestinations.com/nevada/las-vegas/westgate-las-vegas-hotel-casino/casino/supercontest-selections")
  picks_data[0] = picks_data.first.select { |picks| picks.length == 6 }
  picks_data.first.shift

  picks_data.first.each do |picks|
    picks[0] = "EISENMAN'S TEAM" if picks.first == "EISEMAN'S TEAM"
    picks.first.gsub!("\"", "\\\"")
    picks.first.gsub!("'", "\\'")
    picks[0] = "SMASH PLOW" if picks.first == "SNASH PLOW"
    team_id = client.query("SELECT * from teams where name=\"#{picks.first}\"").first["id"]

    picks.shift
    picks.each do |pick|
      client.query("INSERT INTO contest_weekly_picks (team_id, week, team) values (#{team_id}, #{picks_data[1]}, '#{pick}')")
    end
  end
end
