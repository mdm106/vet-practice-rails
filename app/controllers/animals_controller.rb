class AnimalsController < ApplicationController

    before_action :find_owner, only: [:new, :edit]
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
      @animal = Animal.new(animal_params)
      if @animal.valid?
        @animal.save
        redirect_to animal_path(@animal)
      else
        render :new
      end
    end

    def edit
      @animal = Animal.find(params[:id])
    end

    def update
      @animal = Animal.find(params[:id])
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

    private

    def find_owner
      @owner = Owner.find(params[:owner_id].to_i)
    end
end
