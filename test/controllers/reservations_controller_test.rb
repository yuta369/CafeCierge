require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get reservations_create_url
    assert_response :success
  end

  test 'should get show' do
    get reservations_show_url
    assert_response :success
  end

  test 'should get edit' do
    get reservations_edit_url
    assert_response :success
  end

  test 'should get update' do
    get reservations_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get reservations_destroy_url
    assert_response :success
  end
end
