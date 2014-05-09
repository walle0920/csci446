require 'test_helper'

class ConsiderCartsControllerTest < ActionController::TestCase
  setup do
    @consider_cart = consider_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consider_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consider_cart" do
    assert_difference('ConsiderCart.count') do
      post :create, consider_cart: {  }
    end

    assert_redirected_to consider_cart_path(assigns(:consider_cart))
  end

  test "should show consider_cart" do
    get :show, id: @consider_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consider_cart
    assert_response :success
  end

  test "should update consider_cart" do
    patch :update, id: @consider_cart, consider_cart: {  }
    assert_redirected_to consider_cart_path(assigns(:consider_cart))
  end

  test "should destroy consider_cart" do
    assert_difference('ConsiderCart.count', -1) do
     session[:con_cart_id] = @consider_cart.id
      delete :destroy, id: @consider_cart
    end

    assert_redirected_to adoption_store_index_path
  end
end
