require 'test_helper'

class LinePetsControllerTest < ActionController::TestCase
  fixtures :pets
  setup do
    @line_pet = line_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_pet" do
    session[:first] = 2;
    assert_difference('LinePet.count') do
      post :create, pets_id: pets(:betty).id
    end

    assert_redirected_to new_foster_parent_path() do
      post pets_id: pets(:betty).id
    end
  end

  test "should not create line_pet" do
    session[:first] = 1;
    assert_same(3, LinePet.count) do
      post :create, pets_id: pets(:betty).id
    end
  end
  test "should show line_pet" do
    get :show, id: @line_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_pet
    assert_response :success
  end

  test "should update line_pet" do
    patch :update, id: @line_pet, line_pet: { fostered_id: @line_pet.fostered_id, pet_id: @line_pet.pet_id }
    #assert_redirected_to line_pet_path(assigns(:line_pet))
  end

  test "should destroy line_pet" do
    assert_difference('LinePet.count', -1) do
      delete :destroy, id: @line_pet
    end

    #assert_redirected_to line_pets_path
  end
end
