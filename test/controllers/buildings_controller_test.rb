require 'test_helper'

class BuildingsControllerTest < ActionController::TestCase
  setup do
    @building = buildings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buildings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create building" do
    assert_difference('Building.count') do
      post :create, building: { address: @building.address, area: @building.area, description: @building.description, parking_number: @building.parking_number, rooms_number: @building.rooms_number, type: @building.type, user_id: @building.user_id }
    end

    assert_redirected_to building_path(assigns(:building))
  end

  test "should show building" do
    get :show, id: @building
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @building
    assert_response :success
  end

  test "should update building" do
    patch :update, id: @building, building: { address: @building.address, area: @building.area, description: @building.description, parking_number: @building.parking_number, rooms_number: @building.rooms_number, type: @building.type, user_id: @building.user_id }
    assert_redirected_to building_path(assigns(:building))
  end

  test "should destroy building" do
    assert_difference('Building.count', -1) do
      delete :destroy, id: @building
    end

    assert_redirected_to buildings_path
  end
end
