require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post :create, trip: { block_id: @trip.block_id, direction_id: @trip.direction_id, route_id: @trip.route_id, service_id: @trip.service_id, shape_id: @trip.shape_id, trip_headsign: @trip.trip_headsign, trip_id: @trip.trip_id }
    end

    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should show trip" do
    get :show, id: @trip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip
    assert_response :success
  end

  test "should update trip" do
    patch :update, id: @trip, trip: { block_id: @trip.block_id, direction_id: @trip.direction_id, route_id: @trip.route_id, service_id: @trip.service_id, shape_id: @trip.shape_id, trip_headsign: @trip.trip_headsign, trip_id: @trip.trip_id }
    assert_redirected_to trip_path(assigns(:trip))
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @trip
    end

    assert_redirected_to trips_path
  end
end
