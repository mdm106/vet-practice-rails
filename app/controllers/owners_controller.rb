class OwnersController < ApplicationController

    before_action :require_logged_in_user, only: [:new, :create, :edit, :update]

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
        render :new
      end
    end

    def edit
      @owner = Owner.find(params[:id])
    end

    def update
      @owner = Owner.find(params[:id])
      if @owner.valid?
        @owner.update(owner_params)
        redirect_to @owner
      else
        render :edit
      end
    end

    def search  
      if params[:search].blank?  
        redirect_to(root_path, alert: "Empty field!") and return  
      else  
        @parameter = params[:search].downcase  
        @results = Owner.all.where("lower(first_name) LIKE :search", search: @parameter)
      end  
    end
  
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :telephone, :email, :address_1, :address_2, :town, :postcode)
    end

    def require_logged_in_user
      if !logged_in?
        redirect_to('/login')
        flash.alert = "You must login to add an owner"
      end
    end

end
