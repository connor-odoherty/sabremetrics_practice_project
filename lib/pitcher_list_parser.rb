module PitcherListParser
  require 'open-uri'

  def self.get_rankings
    rankings = []
    list = self.get_page(PITCHER_LIST_URL)
    rows = list.xpath('tbody/tr')
    puts('NEW MESSAGE:', rows.inspect)
    puts('THESE ARE ROWS:', rows.collect)

    return []
  end

  def self.get_page(url)
    doc = Nokogiri::HTML(open(url))
    list = doc.xpath("//table[@id='#{url}']")
    return list
  end

  def self.parse_page

  end

  PITCHER_LIST_URL = 'http://www.pitcherlist.com/the-list-51-ranking-the-top-100-starting-pitchers-every-monday/'
  LIST_TABLE_ID = 'table_1'

  def self.add_row(list)

  end

end