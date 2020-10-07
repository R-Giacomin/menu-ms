class BasesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_base, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @bases = Base.search(params[:search])
    else
      @bases = Base.all
    end
  end

  def my_bases
    @user = current_user
    @id = current_user.id
    @bases = Base.where(user_id: @id)
  end

  def show
  end

  def new
    @base = Base.new
  end

  def create
    @base = Base.new(base_params)
    @base.user = current_user
    csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
    if @base.save
      csv_file = params[:base][:import][:attachment]
      CSV.foreach(csv_file.path, csv_options) do |row|
        variable = Variable.create!(name: row[0], description: row[1], category: row[2], base: @base)
      end
      redirect_to basis_path(@base)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @base.user != current_user
      redirect_to root_path, alert: 'Não autorizado'
    else
      if @base.update(base_params)
        redirect_to @base, notice: 'Base foi atualizada.'
      else
        render :edit
      end
    end
  end

  def destroy
    if @base.user != current_user
      redirect_to root_path, alert: 'Não autorizado'
    else
      @base.destroy
      redirect_to bases_path, notice: 'Base excluída.'
    end
  end

  def autocomplete
    render json: Base.search(params[:search],
    {
      fields: [:name, :description, :technical_area],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: { below: 5 }
    }).map(&:name)
  end

  private

  def set_base
    @base = Base.find(params[:id])
  end

  def base_params
    params.require(:base).permit(:name, :description, :legal_base, :user_id, :technical_area, :periodicity, :file)
    # Vamos colocar uma foto/logo da base?
  end
end
