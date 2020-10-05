class OrdersController < ApplicationController
  before_action :set_order, only: %i[update show conclude_order cancel_order]
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @date_time = @order.created_at + DateTime.now.strftime('%z').to_i / 100 * 60 * 60
  end

  def create
    @base = Base.find(params[:id])
    @category = params[:category]
    @order = Order.create!(user_id: current_user.id, category: @category)
    if @order.category == "nIdentificado"
      @base.variables.each do |variable|
        if variable.category == "não cadastral"
          Item.create!(variable_id: variable.id, order_id: @order.id)
        end
      end
    else
      @base.variables.each do |variable|
        Item.create!(variable_id: variable.id, order_id: @order.id)
      end
    end
    redirect_to "#{orders_path}/#{@order.id}"
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

  def strong_params
    params.require(:order).permit(:status, :justify, :category)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
