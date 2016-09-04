require 'test_helper'

class StatisticControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistic_index_url
    assert_response :success
  end

end
