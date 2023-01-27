class RecordsController < ApplicationController
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
      )
    @record.save

    redirect_to "/records/index"
  end

  def edit
    @record = Record.find_by(id: params[:id])
  end

  def update
    @record = Record.find_by(id: params[:id])
    @record.title = params[:title]
    @record.thoughts = params[:thoughts]
    @record.save

    redirect_to "/records/index"
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    @record.destroy
    
    redirect_to "/records/index"
  end
end
