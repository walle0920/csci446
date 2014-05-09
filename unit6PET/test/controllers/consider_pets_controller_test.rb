require 'test_helper'

class ConsiderPetsControllerTest < ActionController::TestCase
  fixtures :pets
  setup do
    @consider_pet = consider_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:consider_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create consider_pet" do
    assert_difference('ConsiderPet.count') do
      post :create, pets_id: pets(:betty).id
    end

    assert_redirected_to adoption_store_index_path
  end

  test "should show consider_pet" do
    get :show, id: @consider_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @consider_pet
    assert_response :success
  end

  test "should create consider_pets via ajax" do
    assert_difference('ConsiderPet.count') do
      xhr :post, :create, pets_id: pets(:betty).id
    end
    assert_response :success
    assert_select_jquery :html, '#cart' do
      assert_select 'tr#current_pet td', /betty/
    end
  end

  test "should update consider_pet" do
    patch :update, id: @consider_pet, consider_pet: { pets_id: @consider_pet.pet_id }
    assert_redirected_to adoption_store_index_path
  end

  test "should destroy consider_pet" do
    assert_difference('ConsiderPet.count', -1) do
      delete :destroy, id: @consider_pet
    end

    assert_redirected_to consider_pets_path
  end
end
