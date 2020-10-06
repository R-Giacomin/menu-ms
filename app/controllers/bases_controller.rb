class BasesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].present?
      @bases = Base.search(params[:search])
    else
      @bases = Base.all
    end
  end

  def show
    @base = Base.find(params[:id])
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
      end  # o redirect estava errado!
      redirect_to basis_path(@base)
    else
      render 'new'
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

  # def import
  #   rowarray = Array.new
  #   myfile = params[:file]

  #   @rowarraydisp = CSV.read(myfile.path)
  # end


def import
  uploaded_file = params[:file]
  File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    file.write(uploaded_file.read)
  end
end


  private

  def base_params
    params.require(:base).permit(:name, :description, :legal_base, :user_id, :technical_area, :file)
    # Vamos colocar uma foto/logo da base?
  end

end
