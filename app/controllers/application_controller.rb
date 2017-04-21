class ApplicationController < ActionController::Base
  require 'net/http'
  require 'json'
  include ApplicationHelper

  def add_set
    current_set = getSet params[:set]
    setName = current_set['name']
    if Sets.find_by(name: setName)
      logger.info "Já tinha o set #{setName}"
      head 200
      return
    end
    sets = sets.new
    sets.name= setName
    sets.save
    current_set['cards'].each do |card|
      processCard(card, sets)
    end
    logger.info "Terminei de processar o set[#{setName}]"
    head 200
  end

  def first_seed
    allsets = getAllSets
    Concurrent::Future.execute do
      allsets.each do |set|
       processSet(set)
      end
      logger.info "Terminei o update"
    end
    head 200
  end

end
