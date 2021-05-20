class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # we need `list_id` to associate list with corresponding list
    @list.save
    redirect_to list_path
  end

  def show
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
