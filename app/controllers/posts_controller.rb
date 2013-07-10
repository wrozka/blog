class PostsController < ApplicationController
  def index
    @posts = Post.published
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    PostAdder.add(params[:post])
    redirect_to root_path
  rescue ActiveRecord::RecordInvalid => invalid
    @post = invalid.record
    render :new
  end
end

