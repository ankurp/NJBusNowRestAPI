require 'test_helper'

class StopTimesControllerTest < ActionController::TestCase
  setup do
    @stop_time = stop_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stop_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stop_time" do
    assert_difference('StopTime.count') do
      post :create, stop_time: { arrival_time: @stop_time.arrival_time, departure_time: @stop_time.departure_time, drop_off_type: @stop_time.drop_off_type, pickup_type: @stop_time.pickup_type, shape_dist_traveled: @stop_time.shape_dist_traveled, stop_id: @stop_time.stop_id, stop_sequence: @stop_time.stop_sequence, trip_id: @stop_time.trip_id }
    end

    assert_redirected_to stop_time_path(assigns(:stop_time))
  end

  test "should show stop_time" do
    get :show, id: @stop_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stop_time
    assert_response :success
  end

  test "should update stop_time" do
    patch :update, id: @stop_time, stop_time: { arrival_time: @stop_time.arrival_time, departure_time: @stop_time.departure_time, drop_off_type: @stop_time.drop_off_type, pickup_type: @stop_time.pickup_type, shape_dist_traveled: @stop_time.shape_dist_traveled, stop_id: @stop_time.stop_id, stop_sequence: @stop_time.stop_sequence, trip_id: @stop_time.trip_id }
    assert_redirected_to stop_time_path(assigns(:stop_time))
  end

  test "should destroy stop_time" do
    assert_difference('StopTime.count', -1) do
      delete :destroy, id: @stop_time
    end

    assert_redirected_to stop_times_path
  end
end
