class PitcherListRankingsController < ApplicationController
  require 'pitcher_list_parser'
  require 'open-uri'
  include PitcherListParser
  before_action :set_pitcher_list_ranking, only: [:show, :edit, :update, :destroy]

  # GET /pitcher_list_rankings
  # GET /pitcher_list_rankings.json
  def index
    @pitcher_list_rankings = get_rankings
    @pitcher_list_rankings_stub = []
  end

  # GET /pitcher_list_rankings/1
  # GET /pitcher_list_rankings/1.json
  def show
  end

  # GET /pitcher_list_rankings/new
  def new
    @pitcher_list_ranking = PitcherListRanking.new
  end

  # GET /pitcher_list_rankings/1/edit
  def edit
  end

  # POST /pitcher_list_rankings
  # POST /pitcher_list_rankings.json
  def create
    @pitcher_list_ranking = PitcherListRanking.new(pitcher_list_ranking_params)

    respond_to do |format|
      if @pitcher_list_ranking.save
        format.html { redirect_to @pitcher_list_ranking, notice: 'Pitcher list ranking was successfully created.' }
        format.json { render :show, status: :created, location: @pitcher_list_ranking }
      else
        format.html { render :new }
        format.json { render json: @pitcher_list_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pitcher_list_rankings/1
  # PATCH/PUT /pitcher_list_rankings/1.json
  def update
    respond_to do |format|
      if @pitcher_list_ranking.update(pitcher_list_ranking_params)
        format.html { redirect_to @pitcher_list_ranking, notice: 'Pitcher list ranking was successfully updated.' }
        format.json { render :show, status: :ok, location: @pitcher_list_ranking }
      else
        format.html { render :edit }
        format.json { render json: @pitcher_list_ranking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pitcher_list_rankings/1
  # DELETE /pitcher_list_rankings/1.json
  def destroy
    @pitcher_list_ranking.destroy
    respond_to do |format|
      format.html { redirect_to pitcher_list_rankings_url, notice: 'Pitcher list ranking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pitcher_list_ranking
      @pitcher_list_ranking = PitcherListRanking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pitcher_list_ranking_params
      params.fetch(:pitcher_list_ranking, {})
    end

  def get_rankings
    rankings = []
    rows = get_rows_from_page(PITCHER_LIST_URL)
    rows.collect.each do |row|
      rankings.push(parse_ranking_elem(row))
    end
    return rankings
  end

  def get_rows_from_page(url)
    page = get_page(url)
    rows = page.xpath('tbody/tr')
    return rows
  end

  def get_page(url)
    doc = Nokogiri::HTML(open(url))
    list = doc.xpath("//table[@id='#{LIST_TABLE_ID}']")
    return list
  end

  def parse_page

  end

  def parse_ranking_elem(row)
    ranking_data = {}
    [
        [:rank,     'td[1]/text()'],
        [:change,   'td[2]/text()'],
        [:name,     'td[3]/text()'],
        [:link,     'td[4]/a/@href'],
        [:previous, 'td[5]/text()'],
        [:best,     'td[6]/text()'],
        [:worst,    'td[7]/text()']
    ].each do |name, xpath|
      ranking_data[name] = row.at_xpath(xpath).to_s.strip
    end
    puts('RANKING DATA:', ranking_data.inspect)
    return ranking_data
  end

  PITCHER_LIST_URL = 'http://www.pitcherlist.com/the-list-51-ranking-the-top-100-starting-pitchers-every-monday/'
  LIST_TABLE_ID = 'table_1'

  def add_row(list)

  end

end
