class UsersController < ApplicationController


    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        render :confirmation
      else
        render :new
      end
    end

    def edit
        @user = User.find(params[:id])
    end
  
    def update
    @user = User.find(params[:id])
        if @user.valid?
            @user.update(user_params)
            render :confirmation
        else
            render :edit
        end
    end

    def show
        @user = User.find(params[:id]) 
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end

    private

    def user_params
        params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)
    end

end
