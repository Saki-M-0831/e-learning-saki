require 'test_helper'

class LearnedWordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learned_words_index_url
    assert_response :success
  end

end
