require 'test_helper'

class StopsControllerTest < ActionController::TestCase
  setup do
    @stop = stops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stop" do
    assert_difference('Stop.count') do
      post :create, stop: { stop_code: @stop.stop_code, stop_desc: @stop.stop_desc, stop_id: @stop.stop_id, stop_lat: @stop.stop_lat, stop_lon: @stop.stop_lon, stop_name: @stop.stop_name, zone_id: @stop.zone_id }
    end

    assert_redirected_to stop_path(assigns(:stop))
  end

  test "should show stop" do
    get :show, id: @stop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stop
    assert_response :success
  end

  test "should update stop" do
    patch :update, id: @stop, stop: { stop_code: @stop.stop_code, stop_desc: @stop.stop_desc, stop_id: @stop.stop_id, stop_lat: @stop.stop_lat, stop_lon: @stop.stop_lon, stop_name: @stop.stop_name, zone_id: @stop.zone_id }
    assert_redirected_to stop_path(assigns(:stop))
  end

  test "should destroy stop" do
    assert_difference('Stop.count', -1) do
      delete :destroy, id: @stop
    end

    assert_redirected_to stops_path
  end
end
