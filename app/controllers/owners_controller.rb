class OwnersController < ApplicationController

    def index
      @owners = Owner.paginate(page: params[:page], per_page: 10)
    end

    def show
        @owner = Owner.find(params[:id]) 
    end

end
