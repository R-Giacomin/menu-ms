class OrdersController < ApplicationController
  before_action :set_order, only: %i(update show conclude cancel)
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show; end

  def update
    @order.concluida!
    redirect_to orders_path
  end

  def conclude
    @order.concluida!
    redirect_to orders_path
  end

  def cancel
    @order.cancelada!
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :justify, :category)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
