class ShopsController < ApplicationController
  # 認証済みであることを確認
before_action :authenticate_user!

def index
  if params[:order] == "0"
    @shops = current_user.shops.order(created_at: :desc)
  else
    @shops = current_user.shops.order(created_at: :asc)
  end
  @num = Shop.count
end

def show
  @shop = target_shop params[:id]
  # @shop = Shop.find_by(id: params[:id])
  # @id = params[:id]
end

def new
  @shop = Shop.new
end

def create
  @shop = current_user.shops.new shop_params
  @shop.save!
  redirect_to shops_url
end

def edit
  @shop = target_shop params[:id]
end

def update
  @shop = target_shop params[:id]
  @shop.update(shop_params)
  redirect_to @shop
end

def destroy
  @shop = target_shop params[:id]
  @shop.destroy
  redirect_to @shop
end

def search
end

private
def target_shop shop_id
  current_user.shops.where(id: shop_id).take
end

def shop_params
  params.require(:shop).permit(:name, :time, :adress, :station, :prefecture, :target_at, :photo, :cost, :taste, :mood, :memo)
end
end
