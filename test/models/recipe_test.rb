require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@recipe = Recipe.new(name: "vegerable", description: "great vegetable recipe")
	end

	test "recipe should be valid0" do
		assert @recipe.valid?
	end
end
