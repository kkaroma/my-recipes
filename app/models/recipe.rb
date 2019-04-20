class Recipe < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	belongs_to :chef
	default_scope -> { order(updated_at: :desc)}
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	has_many :comments, dependent: :destroy

end