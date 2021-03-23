class TreatmentsController < ApplicationController

    load_and_authorize_resource

    before_action :require_logged_in_user

    def index
        @treatments = Treatment.paginate(page: params[:page], per_page: 10)
    end

    def show
        @treatment = Treatment.find(params[:id]) 
    end

    def new
        @animal = Treatment.new
    end

    def create
    @treatment = Treatment.new(treatment_params)
        if @treatment.valid?
            @treatment.save
            render :confirmation
        else
            render :new
        end
    end

    def edit
    @treatment = Treatment.find(params[:id])
    end

    def update
    @treatment = Treatment.find(params[:id])
        if @treatment.valid?
            @treatment.update(treatment_params)
            redirect_to @treatment
        else
            render :edit
        end
    end

    def treatment_params
        params.require(:treatment).permit(:name)
    end

    def require_logged_in_user
        if !logged_in?
            redirect_to('/login')
            flash.alert = "You must login to add a treatment"
        end
    end

end
