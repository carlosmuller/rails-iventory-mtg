module CardsHelper
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
end
