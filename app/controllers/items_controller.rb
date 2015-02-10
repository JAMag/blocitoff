 class ItemsController < ApplicationController
  respond_to :html, :js


  def create
     @item = Item.new(params.require(:list).permit(:title, :body))
     if @item.save
       flash[:notice] = "Item saved."
       redirect_to @item
     else
       flash[:error] = "Error saving item. Please try again."
       render :new
     end
   end  

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    #authorize @item

    if @item.destroy
      flash[:notice] = "Item deleted. Punch to the face."
    else
      flash[:error] = "Item not deleted. Tch'ake it easy."
    end

  respond_with(@item) do |format|
    format.html { redirect_to [@list.item, @list]}
  end
  
  def item_params
    params.require(:item).permit(:body)
  end
  #added based on other github

end
