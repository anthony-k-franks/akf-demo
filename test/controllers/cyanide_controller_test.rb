require 'test_helper'

class CyanideControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cyanide_index_url
    assert_response :success
  end

end
