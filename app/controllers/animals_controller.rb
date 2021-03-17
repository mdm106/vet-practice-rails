class AnimalsController < ApplicationController

    load_and_authorize_resource

    before_action :require_logged_in_user

    def index
      @animals = Animal.paginate(page: params[:page], per_page: 10)
    end

    def show
        @animal = Animal.find(params[:id]) 
    end

    def new
      @animal = Animal.new
    end

    def create
      @animal = animal.new(animal_params)
      @animal.user = current_user
      if @animal.valid?
        @animal.save
        redirect_to animal_path(@animal)
      else
        render :new
      end
    end

    def edit
      @animal = animal.find(params[:id])
    end

    def update
      @animal = animal.find(params[:id])
      @animal.user = current_user
      if @animal.valid?
        @animal.update(animal_params)
        redirect_to @animal
      else
        render :edit
      end
    end
  
    def animal_params
      params.require(:animal).permit(:name, :type_of_animal, :dob, :weight, :height, :biteyness, :owner_id)
    end

    def require_logged_in_user
      if !logged_in?
        redirect_to('/login')
        flash.alert = "You must login to add an animal"
      end
    end
end
