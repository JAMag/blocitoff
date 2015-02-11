class ItemsController < ApplicationController
  respond_to :html, :js


  def create
     @item = Item.new(item_params)
     @list = List.find(params[:list_id])
     @item.list = @list
     if @item.save
       flash[:notice] = "Item saved."
       redirect_to @list
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
  end
  
  def item_params
    params.require(:item).permit(:name)
  end
  #added based on other github

end
