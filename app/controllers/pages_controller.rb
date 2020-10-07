class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :autocomplete]
  def home; end

  def autocomplete
    @bases = Base.search(params[:q])
      results = []
      sql_query = "name @@ :query OR description @@ :query"
      @bases.each do |base|
        text = base.name
        @variables = base.variables.where(sql_query, query: params[:q])
         text += "\n\tVariável: " if @variables.count.positive?
        base.variables.where(sql_query, query: "%#{params[:q]}%").each do |variable|
          text += "\n\t#{variable.name} #{variable.description}"
        end
      result = {
        "id": params[:q],
        "text": text
      }
      results << result
    end

    result = {
      "results": results
    }
    render json: result.to_json
  end
end
