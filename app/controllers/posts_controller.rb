class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:title], thoughts: params[:thoughts])
    if @post.save
      flash[:notice] = 'Succeeded!'
      redirect_to '/posts/index'
    else
      @post.errors.full_messages.each do |message|
        flash[:notice] = message
      end
      render 'new'
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.thoughts = params[:thoughts]
    if @post.save
      flash[:notice] = 'Succeeded!'
      redirect_to '/posts/index'
    else
      @post.errors.full_messages.each do |message|
        flash[:notice] = message
      end
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = 'Succeeded!'
    redirect_to '/posts/index'
  end
end
