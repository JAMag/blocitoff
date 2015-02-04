class ListsController < ApplicationController
  before_action :authenticate_user!

  def show
      @list = current_user.list
  end

  def new
      @list = List.new
  end

   def create
     @list = List.new(params.require(:list).permit(:title, :body))
     if @list.save
       flash[:notice] = "List was saved."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :new
     end
   end  

  def edit
  end
end
