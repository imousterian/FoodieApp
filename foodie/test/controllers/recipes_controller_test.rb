require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    describe "RecipesController" do

        describe "when user is logged in" do

            setup do
                @recipe = recipes(:curry)
                sign_in users(:user1)
            end
            it "should get index" do
                get :index
                assert_response :success
                assert_not_nil assigns(:recipes)
            end
            it "should get new" do
                get :new
                assert_response :success
            end
            it "should create recipe" do
                assert_difference('Recipe.count') do
                    post :create, recipe: {
                        cooking_time: @recipe.cooking_time,
                        cuisine_id: @recipe.cuisine_id,
                        food_preference_id: @recipe.food_preference_id,
                        food_type_id: @recipe.food_type_id,
                        ingredients: @recipe.ingredients,
                        difficulty_level: @recipe.difficulty_level,
                        procedure: @recipe.procedure,
                        servings: @recipe.servings,
                        title: @recipe.title
                    }
                end
                assert_redirected_to recipe_path(assigns(:recipe))
            end
            it "should show recipe" do
                get :show, id: @recipe
                assert_response :success
            end
            it "should get edit" do
                get :edit, id: @recipe
                assert_response :success
            end
            it "should update recipe" do
                patch :update, id: @recipe, recipe: {
                        cooking_time: @recipe.cooking_time,
                        cuisine_id: @recipe.cuisine_id,
                        food_preference_id: @recipe.food_preference_id,
                        food_type_id: @recipe.food_type_id,
                        ingredients: @recipe.ingredients,
                        difficulty_level: @recipe.difficulty_level,
                        procedure: @recipe.procedure,
                        servings: @recipe.servings,
                        title: @recipe.title
                }
                assert_redirected_to recipe_path(assigns(:recipe))
            end
            it "should destroy recipe" do
                assert_difference('Recipe.count', -1) do
                    delete :destroy, id: @recipe
                end
                assert_redirected_to recipes_path
            end
        end

        describe 'when user is not logged in' do
            setup do
                @recipe = recipes(:curry)
            end
            it "not authenticated should not get new" do
                get :new
                assert_response :redirect
            end
            it "not authenticated should not get edit" do
                get :edit, id: @recipe
                assert_response :redirect
            end
            it "not authenticated should not get detroy" do
                delete :destroy, id: @recipe
                assert_response :redirect
            end
        end
        describe "a wrong user" do
            setup do
                @user = users(:user1)
                @recipe = @user.recipes.build(:id => 1, :title => "Food", :food_type_id => 1, :food_preference_id => 1, :cuisine_id => 1)
                @wrong_user = users(:user2)
                sign_in @wrong_user
            end
            it "cannot delete someone else's recipe" do
                 assert_difference('Recipe.count', 0) do
                    delete :destroy, id: @recipe
                end
                assert_redirected_to root_url
            end
        end
    end
end


