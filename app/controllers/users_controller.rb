class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def index
        @user = User.all
    end

    def show
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
        else
            render json: @user.errors.full_messages
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end