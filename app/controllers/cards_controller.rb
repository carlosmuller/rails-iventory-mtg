class CardsController < ApplicationController

  def search
    cards = Card.where('name ILIKE ?', "%#{params[:query]}%")
    render json: cards, except: [:id, :created_at, :update_at, :mid, :sets], include: [:card_sets]
  end
end
