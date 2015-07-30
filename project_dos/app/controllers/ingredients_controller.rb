class IngredientsController < ApplicationController
  def new
      @ingredient = Ingredient.new
  end

  def edit
      @ingredient = Ingredient.find(params[:id])
  end
  def update
      @ingredient = Ingredient.find(params[:id])
      if @ingredient.update_attributes(params.require(:ingredient).permit(:name))
      end
  end
  def create
      @ingredient = Ingredient.new(params.require(:ingredient).permit(:name))
      if @ingredient.save
          flash.now.alert = 'Saved!'
          redirect_to ingredients_path
      else
          flash.now.alert = 'Error. Not a valid ingredient.'
          render 'new_ingredient'
      end
  end

  def index
      @ingredients = Ingredient.all
  end

  def destroy
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      redirect_to ingredients_path
      flash.now.alert = "The ingredient has been removed."

  end
end
