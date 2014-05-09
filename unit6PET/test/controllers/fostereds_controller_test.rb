require 'test_helper'

class FosteredsControllerTest < ActionController::TestCase
  setup do
    @fostered = fostereds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fostereds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should destroy fostered" do
    assert_difference('Fostered.count', -1) do
      delete :destroy, id: @fostered
    end

    assert_redirected_to fostereds_path
  end
end
