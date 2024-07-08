require "test_helper"

class ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get confirmations_destroy_url
    assert_response :success
  end

  test "should get confirm" do
    get confirmations_confirm_url
    assert_response :success
  end
end
