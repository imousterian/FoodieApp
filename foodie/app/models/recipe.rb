class Recipe < ActiveRecord::Base
    DIFFICULTY=%w(Easy Medium Hard)
    belongs_to :food_type
    belongs_to :food_preference
    belongs_to :cuisine
    belongs_to :user

    validates :cuisine_id, :food_preference_id, :cuisine_id, :title, :food_type_id, :presence => true
end
