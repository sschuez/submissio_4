require "test_helper"

class SubmissiosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get submissios_index_url
    assert_response :success
  end
end
