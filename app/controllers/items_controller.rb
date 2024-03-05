class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item , only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @has_exchange_comment = @comments.where(user_id: current_user.id).exists? if current_user
  end

  def edit 
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :prefecture_id, :shipping_day_id, :wanted_item).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
