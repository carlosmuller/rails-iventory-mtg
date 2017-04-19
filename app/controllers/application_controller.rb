class ApplicationController < ActionController::Base
  require 'net/http'
  require 'json'

  def add_set

  end

  def first_seed
    allsets = getAllSets
    Concurrent::Future.execute do
      allsets.each do |set|
        setName = set['name']
        logger.info "Começando a processar o set[#{setName}]"
        sets = Sets.find_by(name: setName)
        if !sets
          sets = Sets.new
          sets.name= setName
          sets.save
        end
        set['cards'].each do |card|
          cardName = card['name']
          logger.info "Começando a processar o card[#{cardName}]"
          card_find_by = Card.find_by(name: cardName)
          if card_find_by
            card_find_by.merge card
            card_find_by.save
            logger.info "Fiz update no card[#{cardName}]"
          else
            card_find_by = Card.new
            card_find_by.createFromJson(card)
            card_find_by.save
            logger.info "Criei o card[#{cardName}]"
          end
          card_set = CardSet.new
          card_set.card = card_find_by
          card_set.sets = sets
          card_set.mid = card['multiverseid']
          card_set.save
        end
        logger.info "Terminei de processar o set[#{setName}]"
      end
      logger.info "Terminei  o update"
    end
    head 200
  end

  def getSet set
    response = Net::HTTP.get_response('mtgjson.com', "/json/#{set}")
    return JSON.parse(response.body)
  end

  def getAllSets
    response = Net::HTTP.get_response('mtgjson.com', '/json/AllSetsArray-x.json')
    return JSON.parse(response.body)
  end
end
