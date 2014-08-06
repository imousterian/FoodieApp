class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

    helper_method :food_preferences, :food_types, :cuisines, :all_foods, :all_foods_titles

    protect_from_forgery with: :exception

    def food_preferences
        @food_preferences = FoodPreference.all
    end

    def food_types
        @food_types = FoodType.all
    end

    def cuisines
        @cuisines = Cuisine.all
    end

    def all_foods
        [FoodPreference.all, FoodType.all, Cuisine.all]
    end

    def all_foods_titles
        ['Food preferences', 'Food types', 'Cuisine']
    end
end
