class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit,:update ]
  before_action :require_admin, except: [:show, :index]
    def new
      @ingredient = Ingredient.new
    end

    def create
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
        flash[:success] = "Ingredient successfully created"
        redirect_to @ingredient
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
    

    def show
      @ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
    end

    def index
        @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
    end

    def edit
    end

    def update
      if @ingredient.update(ingredient_params)
        flash[:success] = "Ingredient Successfully updated"
        redirect_to @ingredient
      else
        render 'edit'
      end
    end


    private
      def ingredient_params
        params.require(:ingredient).permit(:name)
      end


    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def require_admin
      if !logged_in? || (logged_in? && !current_chef.admin?)
        flash[:notice] = "You cannot perform that action"
        redirect_to ingredients_path
      end
    end

end
