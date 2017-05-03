require 'test_helper'

class PitcherListRankingsControllerTest < ActionController::TestCase
  setup do
    @pitcher_list_ranking = pitcher_list_rankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pitcher_list_rankings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pitcher_list_ranking" do
    assert_difference('PitcherListRanking.count') do
      post :create, pitcher_list_ranking: {  }
    end

    assert_redirected_to pitcher_list_ranking_path(assigns(:pitcher_list_ranking))
  end

  test "should show pitcher_list_ranking" do
    get :show, id: @pitcher_list_ranking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pitcher_list_ranking
    assert_response :success
  end

  test "should update pitcher_list_ranking" do
    patch :update, id: @pitcher_list_ranking, pitcher_list_ranking: {  }
    assert_redirected_to pitcher_list_ranking_path(assigns(:pitcher_list_ranking))
  end

  test "should destroy pitcher_list_ranking" do
    assert_difference('PitcherListRanking.count', -1) do
      delete :destroy, id: @pitcher_list_ranking
    end

    assert_redirected_to pitcher_list_rankings_path
  end
end
