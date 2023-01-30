class RecordsController < ApplicationController
  before_action :authenticate_user

  def index
    @records = Record.all.order(created_at: :desc)
  end

  def show
    @record = Record.find_by(id: params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(
      title: params[:title],
      thoughts: params[:thoughts],
      user_id: @current_user.id
      )
    if @record.save
      flash[:notice] = 'Successful registration!'
      redirect_to '/records/index'
    else
      render 'records/new'
    end
  end

  def edit
    @record = Record.find_by(id: params[:id])
  end

  def update
    @record = Record.find_by(id: params[:id])
    @record.title = params[:title]
    @record.thoughts = params[:thoughts]
    if @record.save
      flash[:notice] = 'Successful edit!'
      redirect_to '/records/index'
    else
      render 'records/edit'
    end
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    @record.destroy
    flash[:notice] = 'Successful deletion!'
    redirect_to '/records/index'
  end
end
