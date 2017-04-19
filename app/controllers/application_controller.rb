class ApplicationController < ActionController::Base
  require 'net/http'
  require 'json'


  def update_cards
    allsets = getAllSets
    Concurrent::Future.execute do
      allsets.each do |set|
        setName = set['name']
        logger.info "Começando a processar o set[#{setName}]"
        set['cards'].each do |card|
          cardName = card['name']
          logger.info "Começando a processar o card[#{cardName}]"
          card_find_by = Card.find_by(name: cardName)
          if card_find_by
            card_find_by.merge card, setName
            card_find_by.save
            logger.info "Fiz update no card[#{cardName}]"
          else
            cardToCreate = Card.new
            cardToCreate.createFromJson(card, setName)
            cardToCreate.save
            logger.info "Criei o card[#{cardName}]"
          end
        end
        logger.info "Terminei de processar o set[#{setName}]"
      end
      logger.info "Terminei  o update"
    end
    head 200
  end

  def getAllSets
    response = Net::HTTP.get_response('mtgjson.com', '/json/AllSetsArray-x.json')
    return JSON.parse(response.body)
  end
end
