require 'test_helper'

class MinioserverControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
