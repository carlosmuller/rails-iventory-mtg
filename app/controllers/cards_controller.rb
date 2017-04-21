class CardsController < ApplicationController

  def search
    cards = Card.where('name ILIKE ?', "%#{params[:query]}%")
    render json: cards
  end
end
