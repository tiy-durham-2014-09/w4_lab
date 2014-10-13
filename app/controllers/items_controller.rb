class ItemsController < ApplicationController
  before_action :find_list
  def index
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)
    if @item.save
      flash[:success] = "Added todo list item."
      redirect_to list_items_path
    else
      flash[:error] = "Encountered error adding item."
      render action: :new
    end
  end

  def edit
    @item = @list.items.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Saved todo list item."
      redirect_to list_items_path
    else
      flash[:error] = "That todo item could not be saved."
      render action: :edit
    end
  end

  def destroy
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:success] = "Todo list item was deleted."
    else
      flash[:error] = "Todo list item could not be deleted."
    end
    redirect_to list_items_path
  end

  def complete
    @item = @list.items.find(params[:id])
    @item.update_attribute(:completed_by, Time.now)
    redirect_to list_items_path, notice: "Todo item marked as complete."
  end

  def url_options
    {list_id: params[:list_id]}.merge(super)
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end
  def item_params
    params[:item].permit(:content)
  end
end
