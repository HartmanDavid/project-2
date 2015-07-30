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
      @pet = Pet.where(user_id: current_user.id).find(params[:id])
  end

  def index
      @pets = current_user.pets #trying to keep proper auth.
  end

  def show
      @pet = Pet.where(user_id: current_user.id).find(params[:id])
  end

  def update
      @pet = Pet.where(user_id: current_user.id).find(params[:id])
      if @pet.update_attributes(params.require(:pet).permit( :name, :sex, :breed, :species, :age))
      redirect_to pet_path
      end
  end
  def destroy
      @pet = Pet.where(user_id: current_user.id).find(params[:id])
      @pet.destroy
      flash.now.alert = "#{Pet.name} has been removed."
      redirect_to pets_path

  end
end
