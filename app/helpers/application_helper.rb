module ApplicationHelper
  require 'net/http'
  require 'json'
  include CardsHelper

  def processSet(set, useLogger)
    setName = set['name']
    messageSet = "Começando a processar o set[#{setName}]"
    log(messageSet, useLogger)
    sets = Sets.find_by(name: setName)
    if !sets
      sets = Sets.new
      sets.name= setName
      sets.code= set['code']
      sets.save
    end
    set['cards'].each do |card|
      processCard(card, sets, useLogger)
    end
    messageSet = "Terminei de processar o set[#{setName}]"
    log messageSet, useLogger
  end

  def log(messageSet, useLogger)
    if useLogger
      logger.info messageSet
    else
      puts messageSet
    end
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
