require 'test_helper'

class RecipeFlowsTest < ActionDispatch::IntegrationTest

    fixtures :recipes
    test "create recipes" do
        https!
        curry = recipes(:curry)
        get "/recipes/new"
        assert_response :success
        post_via_redirect "recipes", :recipe => {id: recipes(:curry).id,
            title: recipes(:curry).title, food_preference_id: recipes(:curry).food_preference_id,
            food_type_id: recipes(:curry).food_type_id,
            cuisine_id: recipes(:curry).cuisine_id
            }
        assert_response :success
        assert_equal '/recipes/2', path
        https!(false)
        get "/recipes"
        assert_response :success
        assert_not_nil assigns(:recipes)
    end
end
