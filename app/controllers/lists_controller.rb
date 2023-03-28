class ListsController < ApplicationController

  before_action :find_list, only: %i[show]
  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(permit)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def permit
    params.require(:list).permit(:name)
  end
end
