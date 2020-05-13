require 'test_helper'

class RideRequestsControllerTest < ActionController::TestCase
  setup do
    @ride_request = ride_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ride_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not send empty email" do
    rideoffer_match = RideOffer.create(username:"user",origin:"origin",destination:"destination",rideTime:Time.current,rideDate:Date.current)
    riderequest_match = RideRequest.create(username:"user1",origin:"origin1",destination:"destination",rideTime:Time.current,rideDate:Date.current)
    assert_not :send_emails
    rideoffer_match.destroy
    riderequest_match.destroy
  end

  test "should not create empty ride_request" do
    ride_request = RideRequest.create
    assert_not ride_request.save
  end

  test "should create ride_request" do
    assert_difference('RideRequest.count') do
      post :create, ride_request: { comments: @ride_request.comments, destination: @ride_request.destination, moneyOffered: @ride_request.moneyOffered, origin: @ride_request.origin, rideDate: @ride_request.rideDate, rideTime: @ride_request.rideTime, username: @ride_request.username }
    end

    assert_redirected_to ride_request_path(assigns(:ride_request))
  end

  test "should show ride_request" do
    get :show, id: @ride_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride_request
    assert_response :success
  end

  test "should update ride_request" do
    patch :update, id: @ride_request, ride_request: { comments: @ride_request.comments, destination: @ride_request.destination, moneyOffered: @ride_request.moneyOffered, origin: @ride_request.origin, rideDate: @ride_request.rideDate, rideTime: @ride_request.rideTime, username: @ride_request.username }
    assert_redirected_to ride_request_path(assigns(:ride_request))
  end

  test "should destroy ride_request" do
    assert_difference('RideRequest.count', -1) do
      delete :destroy, id: @ride_request
    end

    assert_redirected_to ride_requests_path
  end
end
