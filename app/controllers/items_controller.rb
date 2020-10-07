class ItemsController < ApplicationController
  before_action :set_item, only: %i(create destroy)

  def destroy
    @order = Order.find(@item.order_id)
    @item.destroy
    @order.destroy if @order.items.count.zero?
    redirect_to order_path(@order)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
