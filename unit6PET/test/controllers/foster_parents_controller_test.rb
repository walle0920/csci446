require 'test_helper'

class FosterParentsControllerTest < ActionController::TestCase
  fixtures :pets
  setup do
    @foster_parent = foster_parents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foster_parents)
  end

  test "requires item in cart" do
    get :new
    assert_redirected_to adoption_store_index_path
    assert_equal flash[:notice], "Your place is empty"
  end
  test "should get new" do
   item = LinePet.new
   item.pet = pets(:betty)
   item.build_fostered
   item.save!
   session[:fostered_id] = item.fostered.id
    get :new
    assert_response :success
  end

  test "should create foster_parent" do
    session[:curr_pet_id] = pets(:betty).id;
    assert_difference('FosterParent.count') do
      post :create, foster_parent: { address: @foster_parent.address, email: @foster_parent.email, name: @foster_parent.name}
    end

    assert_redirected_to adoption_store_index_path
  end

  test "should show foster_parent" do
    get :show, id: @foster_parent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @foster_parent
    assert_response :success
  end

  test "should update foster_parent" do
    patch :update, id: @foster_parent, foster_parent: { address: @foster_parent.address, email: @foster_parent.email, name: @foster_parent.name }
    assert_redirected_to foster_parent_path(assigns(:foster_parent))
  end

  test "should destroy foster_parent" do
    assert_difference('FosterParent.count', -1) do
      delete :destroy, id: @foster_parent
    end

    assert_redirected_to foster_parents_path
  end
end
