class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    @post = Post.new(title: params[:title], thoughts: params[:thoughts])
    @post.save
    redirect_to('/posts/index')
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.thoughts = params[:thoughts]
    @post.save
    redirect_to('/posts/index')
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to('/posts/index')
  end
end
