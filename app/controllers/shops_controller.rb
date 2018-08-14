class ShopsController < ApplicationController
  # 認証済みであることを確認
before_action :authenticate_user!

def index
  @shops = current_user.shops
end

def show
  @shop = target_shop params[:id]
end

def new
  @shop = Shop.new
end

def create
  @shop = current_user.shops.new shop_params
  @shop.save!
  redirect_to @shop
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
  redirect_to shops_url
end

private
def target_shop shop_id
  current_user.shops.where(id: shop_id).take
end

def shop_params
  params.require(:shop).permit(:name, :time, :address, :station, :prefecture, :photo, :cost, :taste, :mood, :memo)
end
end
