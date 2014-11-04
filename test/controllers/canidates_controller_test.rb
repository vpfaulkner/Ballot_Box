require 'test_helper'

class CanidatesControllerTest < ActionController::TestCase
  setup do
    @canidate = canidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create canidate" do
    assert_difference('Canidate.count') do
      post :create, canidate: { name: @canidate.name, party: @canidate.party }
    end

    assert_redirected_to canidate_path(assigns(:canidate))
  end

  test "should show canidate" do
    get :show, id: @canidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @canidate
    assert_response :success
  end

  test "should update canidate" do
    patch :update, id: @canidate, canidate: { name: @canidate.name, party: @canidate.party }
    assert_redirected_to canidate_path(assigns(:canidate))
  end

  test "should destroy canidate" do
    assert_difference('Canidate.count', -1) do
      delete :destroy, id: @canidate
    end

    assert_redirected_to canidates_path
  end
end
