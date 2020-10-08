class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :autocomplete, :about_us, :manager]

  def home
  end

  def autocomplete
    @bases = Base.search(params[:q])
      results = []
      sql_query = "name @@ :query OR description @@ :query"
      @bases.each do |base|
        text = "<div>"
        text += base.name
        @variables = base.variables.search(params[:q])
         text += "<p>Variável: " if @variables.count.positive?
        # base.variables.where(sql_query, query: "%#{params[:q]}%").each do |variable|
        @variables.each do |variable|
          text += "#{variable.name} --> descrição: #{variable.description}"
        end
        text += "</p>" if @variables.count.positive?
        text += "</div>"
        result = {
          "id": base.name,
          "text": text
        }
        results << result
      end

    result = {
      "results": results
    }
    render json: result.to_json
  end

  def about_us
  end

  def manager
  end
end
