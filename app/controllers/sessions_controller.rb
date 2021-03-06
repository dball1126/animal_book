class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email],
                                         params[:user][:password])
        if @user
            login!(@user)
           
            redirect_to user_posts_url(@user)
        else 
            render json: ["Invalid credentials"], status: 401
        end
    end

    def destroy
        @user = current_user
        if @user
            logout!
            render json: {}
        else
            render json: ["No one is currently signed in"], status: 404
        end
    end
end