require 'test_helper'

class ComicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comic_index_url
    assert_response :success
  end

end
