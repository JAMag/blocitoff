class ListsController < ApplicationController

  before_action :authenticate_user!

  def index
    @list = current_user.list
  end

  def show
    @list = List.find(params[:id])
  end
  #added due to other github

  def show
      @list = current_user.list
      @item = Item.new
  end

  def new
      @list = List.new
  end

   def create
     @list = List.new(params.require(:list).permit(:title, :body))
     @list.user = current_user
     if @list.save
       flash[:notice] = "List saved."
       redirect_to @list
     else
       flash[:error] = "Error saving list. Please try again."
       render :new
     end
   end  

  def edit
    @list = current_user.lists
  end

   def list_params
    params.require(:list).permit(:title)
  end
  #added due to other github
end
