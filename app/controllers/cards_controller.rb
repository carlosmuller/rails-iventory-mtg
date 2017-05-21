# encoding: UTF-8
class CardsController < ApplicationController

  def search
    query = params[:query]
    query.sub!('æ', 'ae')
    query.sub!("'", "%")
    if query.length < 3
      render json: { 'error': 'please use more letters' }
      return
    end
    cards = searchCard(query)
    if cards.length < 1
      query.sub!(" ", "%")
      cards = searchCard query
    end
    render json: cards
  end

  def searchCard(query)
    Card.where('name ILIKE ?', "%#{query}%")
  end
end
