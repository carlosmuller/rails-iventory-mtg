class SetsController < ApplicationController

  def byCode
    code = params[:code]
    sets = Sets.find_by_code code
    render json: sets
  end

end
