class ItemsController < ApplicationController

  def index
    if params[:user_id] 
      items = User.find(params[:user_id]).items
    else
      items = Item.all
    end
    render json: items, include: :user
  end


  def show
    item = Item.find(params[:id])
    render json: item
  end
  
  def create
    if params[:user_id]
      item = Item.create!(paramsallowed)
    else
      item = Item.create!(paramsallowed)
    end
    render json: item, status: 201
  end

  private

  def paramsallowed
    params.permit(:price,:name,:description,:user_id)
  end
end
