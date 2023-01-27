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

  def edit
  end
end
