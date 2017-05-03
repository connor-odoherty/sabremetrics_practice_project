module PitcherListHelpers::PitcherListParser
  require 'open-uri'

  def self.get_page
    doc = Nokogiri::HTML(open(PITCHER_LIST_URL))
    list = doc.xpath("//table[@id='#{LIST_TABLE_ID}']")
    puts('PITCHER LIST:', list)
  end

  def parse_page

  end

  PITCHER_LIST_URL = 'http://www.pitcherlist.com/the-list-51-ranking-the-top-100-starting-pitchers-every-monday/'
  LIST_TABLE_ID = 'table_1'

end