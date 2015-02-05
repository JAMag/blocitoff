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
       flash[:notice] = "List created."
       redirect_to @list
     else
       flash[:error] = "There was an error creating the list. Please try again."
       render :new
     end
   end  
end
