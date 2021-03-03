class OwnersController < ApplicationController

    def index
      @owners = Owner.paginate(page: params[:page], per_page: 10)
    end

    def show
        @owner = Owner.find(params[:id]) 
    end

    def new
      @owner = Owner.new
    end

    def create
      @owner = Owner.new(owner_params)
      if @owner.valid?
        @owner.save
        redirect_to owner_path(@owner)
      else
        render 'new'
      end
    end
  
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :telephone, :email, :address_1, :address_2, :town, :postcode)
    end

end
