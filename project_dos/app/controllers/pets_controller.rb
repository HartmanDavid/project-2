class PetsController < ApplicationController
  def new
      @pet = Pet.new
  end

  def create
      @pet = Pet.new(params.require(:pet).permit(:name, :age, :sex, :species, :breed ))
      @pet.user = current_user
      if @pet.save
          redirect_to pet_path(@pet.id)
      else
          flash.now.alert = "Sorry. Information did not save."
          render 'new'
      end
  end

  def edit
      @pet = Pet.find(params[:id])
  end

  def index
      @pets = Pet.all
  end

  def show
      @pet = Pet.find(params[:id])
  end

  def update
      @pet = Pet.find(params[:id])
      if @pet.update_attributes(params.require(:pet).permit( :name, :sex, :breed, :species, :age))
      end
  end
  def destroy
      @pet = Pet.find(params[:id])
      @pet.destroy
      flash.now.alert = "#{Pet.name} has been removed."
    #   redirect_to pets_path

  end
end
