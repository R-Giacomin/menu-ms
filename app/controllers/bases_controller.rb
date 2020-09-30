class BasesController < ApplicationController


  def index
    @bases = Base.all
  end

  def show
    @base = Base.find(params[:id])
    # @variables = Variable.new
  end

  def new
    @base = Base.new
  end

  def create
    @base = Base.new(base_params)
    if @base.save
        redirect_to base_path(@base)
    else
        render 'new'
    end
  end

  private

  def base_params
    params.require(:base).permit(:name, :description, :legal_base, :user_id, :technical_area)
    #Vamos colocar uma foto/logo da base?
  end
end
