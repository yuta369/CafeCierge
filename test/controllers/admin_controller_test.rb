require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get manage_users" do
    get admin_manage_users_url
    assert_response :success
  end

  test "should get manage_cafes" do
    get admin_manage_cafes_url
    assert_response :success
  end

  test "should get manage_reviews" do
    get admin_manage_reviews_url
    assert_response :success
  end

  test "should get manage_comments" do
    get admin_manage_comments_url
    assert_response :success
  end
end
