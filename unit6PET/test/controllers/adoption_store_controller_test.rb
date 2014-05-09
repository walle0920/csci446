require 'test_helper'

class AdoptionStoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select "#columns #side a", minimum: 2
    assert_select "#main .entry", 3
    assert_select 'h3', "betty"
  end

  test "markup needed for adoption_store.js.coffee is in place" do
    get :index
    assert_select  '.adoption_store .entry > img', 3
    assert_select '.entry input[type=submit]', 0
  end
end
