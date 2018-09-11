require 'test_helper'

class RedirectionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redirection_index_url
    assert_response :success
  end

end
