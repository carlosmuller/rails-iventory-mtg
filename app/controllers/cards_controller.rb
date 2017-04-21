class CardsController < ApplicationController

  def search
    cards = Card.where('name ILIKE ?', "%#{params[:query]}%")
    cards.each do |card|
      logger.info card
    end
    render json: cards, except: [:id, :created_at, :update_at, :mid, :sets], include: [:card_sets]
  end
end
