class OrdersController < ApplicationController
  before_action :set_order, only: %i[update show conclude_order cancel_order]
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show; end

  def create
    @base = Base.find(params[:id])
    @order = Order.create!(status: "aberta", category: "pessoais",
                           justify: "Uma justificativa", user_id: current_user.id)
    @base.variables.each do |variable|
      Item.create!(variable_id: variable.id, order_id: @order.id)
    end
    redirect_to orders_path
  end

  def update; end

  def conclude_order
    @order.concluida!
    redirect_to orders_path
  end

  def cancel_order
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
