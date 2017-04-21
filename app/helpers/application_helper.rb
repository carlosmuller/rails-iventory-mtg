module ApplicationHelper
    include CardsHelper

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
  
  def getSet (set)
    response = Net::HTTP.get_response('mtgjson.com', "/json/#{set}.json")
    return JSON.parse(response.body)
  end

  def getAllSets()
    response = Net::HTTP.get_response('mtgjson.com', '/json/AllSetsArray-x.json')
    return JSON.parse(response.body)
  end

end
