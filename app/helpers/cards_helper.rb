module CardsHelper
  def processCard(card, sets, useLogger)
    cardName = card['name']
    log "Começando a processar o card[#{cardName}]", useLogger
    card_find_by = Card.find_by(name: cardName)
    if card_find_by
      card_find_by.merge card
      card_find_by.save
      log "Fiz update no card[#{cardName}]", useLogger
    else
      card_find_by = Card.new
      card_find_by.createFromJson(card)
      card_find_by.save
      log "Criei o card[#{cardName}]", useLogger
    end
    card_set      = CardSet.new
    card_set.card = card_find_by
    card_set.sets = sets
    card_set.mid  = card['multiverseid']
    card_set.save
  end

  def log(messageSet, useLogger)
    if useLogger
      logger.info messageSet
    else
      puts messageSet
    end
  end
end
