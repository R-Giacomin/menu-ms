class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:status, :justify, :category)
  end
end
