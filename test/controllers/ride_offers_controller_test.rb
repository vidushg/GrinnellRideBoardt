require 'test_helper'

class RideOffersControllerTest < ActionController::TestCase
  setup do
    @ride_offer = ride_offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ride_offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not save empty ride_offer" do
    ride_test = RideOffer.create
    assert_not ride_test.save
  end

  test "should create ride_offer" do
    assert_difference('RideOffer.count') do
      post :create, ride_offer: { comments: @ride_offer.comments, destination: @ride_offer.destination, moneyRequested: @ride_offer.moneyRequested, origin: @ride_offer.origin, rideDate: @ride_offer.rideDate, rideTime: @ride_offer.rideTime, username: @ride_offer.username }
    end

    assert_redirected_to ride_offer_path(assigns(:ride_offer))
  end

  test "should show ride_offer" do
    get :show, id: @ride_offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ride_offer
    assert_response :success
  end

  test "should update ride_offer" do
    patch :update, id: @ride_offer, ride_offer: { comments: @ride_offer.comments, destination: @ride_offer.destination, moneyRequested: @ride_offer.moneyRequested, origin: @ride_offer.origin, rideDate: @ride_offer.rideDate, rideTime: @ride_offer.rideTime, username: @ride_offer.username }
    assert_redirected_to ride_offer_path(assigns(:ride_offer))
  end

  test "should destroy ride_offer" do
    assert_difference('RideOffer.count', -1) do
      delete :destroy, id: @ride_offer
    end

    assert_redirected_to ride_offers_path
  end
end
