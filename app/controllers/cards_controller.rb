# encoding: UTF-8
class CardsController < ApplicationController

  def search
    query = params[:query]
    query.sub!('æ', 'ae')
    if query.length < 3
      render json: error, root: true
      return
    end
    cards = Card.where('name ILIKE ?', "#{query}%")
    render json: cards
  end
end
