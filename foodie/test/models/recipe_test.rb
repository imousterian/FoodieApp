require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

    describe "Recipe" do
        let(:recipe) { recipes(:curry) }

        it "is valid with valid params" do
            recipe.must_be :valid?
        end

        it "is not valid without title" do
            recipe.title = ""
            recipe.wont_be :valid?
            recipe.errors[:title].must_be :present?
        end

        it "is not valid without food_preference_id" do
            recipe.food_preference_id = ""
            recipe.wont_be :valid?
            recipe.errors[:food_preference_id].must_be :present?
        end

        it "is not valid without food_type_id" do
            recipe.food_type_id = ""
            recipe.wont_be :valid?
            recipe.errors[:food_type_id].must_be :present?
        end

        it "is not valid without cuisine_id" do
            recipe.cuisine_id = ""
            recipe.wont_be :valid?
            recipe.errors[:cuisine_id].must_be :present?
        end

    end

end
