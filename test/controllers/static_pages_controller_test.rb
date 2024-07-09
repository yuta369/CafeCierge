require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get privacy_policy' do
    get static_pages_privacy_policy_url
    assert_response :success
  end

  test 'should get terms_of_service' do
    get static_pages_terms_of_service_url
    assert_response :success
  end

  test 'should get help' do
    get static_pages_help_url
    assert_response :success
  end

  test 'should get contact' do
    get static_pages_contact_url
    assert_response :success
  end

  test 'should get confirm' do
    get static_pages_confirm_url
    assert_response :success
  end

  test 'should get complete' do
    get static_pages_complete_url
    assert_response :success
  end
end
