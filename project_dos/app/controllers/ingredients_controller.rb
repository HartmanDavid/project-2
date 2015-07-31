class IngredientsController < ApplicationController
    before_action  :authorize, except: [:show, :edit, :update, :destroy]
  def new
      @ingredient = Ingredient.new
  end

  def edit
      @ingredient = Ingredient.find(params[:id])
  end

  def update
      @ingredient = Ingredient.find(params[:id])
      if @ingredient.update_attributes(params.require(:ingredient).permit(:name))
          redirect_to ingredients_path
      end
  end
  def show
      @ingredient = Ingredient.find(params[:id])
  end

  def create
      @ingredient = Ingredient.new(params.require(:ingredient).permit(:name))
      if @ingredient.save
          flash.alert = 'Saved!'
          redirect_to ingredients_path
      else
          flash.alert = 'Error. Not a valid ingredient.'
          render new_ingredient_path
      end
  end

  def index
      @ingredients = Ingredient.all
  end

  def destroy
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      redirect_to ingredients_path
      flash.alert = "The ingredient has been removed." #Flash ont working

  end
end
