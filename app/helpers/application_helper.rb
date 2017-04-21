module ApplicationHelper

 def processSet(set)
    setName = set['name']
    logger.info "Começando a processar o set[#{setName}]"
    sets = Sets.find_by(name: setName)
    if !sets
      sets = Sets.new
      sets.name= setName
      sets.save
    end
    set['cards'].each do |card|
      processCard(card, sets)
    end
    logger.info "Terminei de processar o set[#{setName}]"
  end

  def processCard(card, sets)
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
  
  def getSet (set)
    response = Net::HTTP.get_response('mtgjson.com', "/json/#{set}.json")
    return JSON.parse(response.body)
  end

  def getAllSets()
    response = Net::HTTP.get_response('mtgjson.com', '/json/AllSetsArray-x.json')
    return JSON.parse(response.body)
  end

end
