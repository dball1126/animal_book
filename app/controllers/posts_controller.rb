class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @post = Post.new
    end
    def show
        render json: @post
    end
    def index
        @posts = Post.all
        
    end
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
       
        if @post.save
            redirect_to user_posts_url
        else
            render json: @post.errors.full_messages, status: 422
        end

    end
    def update
        @post = Post.find_by(id: params[:id])
        
        if @post.update_attributes(post_params)
            render json: index
        else
            render json: @post.errors.full_messages, status: 422
        end
    end
    def edit
        @post = Post.find(params[:id])
    end
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_url
    end
    private
    def post_params
        params.require(:post).permit(:body, :user_id)
    end
end