class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: 'default_user.jpeg'
    )
    if @user.save
      flash[:notice] = 'Registration Complet!'
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.images_name = '#{@user.id}.jpg'
      image = params[:image]
      File.binwrite('public/user_images/#{@user.image_name}', image.read)
    end

    if @user.save
      flash[:notice] = 'Edited User Information!'
      render 'show'
    else
      render 'edit'
    end
  end
end
