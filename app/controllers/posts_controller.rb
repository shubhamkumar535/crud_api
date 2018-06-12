class PostsController < ApplicationController

  def index
    @post = Post.all

    render json: @post
  end
  def create


    @post = Post.new(title: params[:title], text: params[:text])
 
    if @post.save
    	render json: @post
     else
      render json: {error: 'process not completed'}
    end

  end
 
  def update
     @post = Post.find(params[:id])
 
    if @post.update(title: params[:title], text: params[:text])
      render json: @post
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
   
 
    if @post.destroy
            render json: {status: 'successfull'}
        else
            render json: {error: 'Operation not completed'}
        end
  end


end
