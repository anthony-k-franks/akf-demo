require 'test_helper'

class DilbertControllerTest < ActionDispatch::IntegrationTest
  test "should get dilbert" do
    get dilbert_dilbert_url
    assert_response :success
  end

end
