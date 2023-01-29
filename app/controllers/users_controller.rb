class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'Successful user registration!'
      render 'users/show'
    else
      render 'users/new'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = 'Successful edit!'
      render 'users/show'
    else
      render 'users/edit'
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Successful login!'
      redirect_to '/records/index'
    else
      @error_message = 'Incorrect email address or password.'
      @email = params[:email]
      @password = params[:password]
      render 'users/login_form'
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to '/login'
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = 'No authorisation.'
      redirect_to '/records/index'
    end
  end
end
