class ItemsController < ApplicationController
  before_action :set_item, only: %i(create destroy)

  # transfered for Base controller
  # def create
  #   @base = Base.find(params[:base_id])
  #   @order = Orders.new
  #   @base.variables.each do |variable|
  #     @item = Item.new(variable_id: variable)
  #     @order.item = @item
  #   end
  #   redirect_to orders_path
  # end

  def destroy
    @order = Order.find(@item.order_id)
    @item.destroy
    @order.destroy if @order.items.count.zero?
    redirect_to orders_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end


#Passo 1 - concertar a rota para um novo item - item nested em base
# passo 2 - botão para rota correta
# Passo 3 - create do item
#encontra as variáveis desta base
# para cada variável cria um item
# criar uma nova order e associar os itens
