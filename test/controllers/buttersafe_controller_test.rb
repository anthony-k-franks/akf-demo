require 'test_helper'

class ButtersafeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buttersafe_index_url
    assert_response :success
  end

end
