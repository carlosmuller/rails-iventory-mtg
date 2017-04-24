class ApplicationController < ActionController::Base
  include ApplicationHelper

  def addSet
    current_set = getSet params[:set]
    setName = current_set['name']
    if Sets.find_by(name: setName)
      logger.info "Já tinha o set #{setName}"
      head 200
      return
    end
    processSet current_set, true
    logger.info "Terminei de processar o set[#{setName}]"
    head 200
  end

  def first_seed
    allsets = getAllSets
    Concurrent::Future.execute do
      allsets.each do |set|
       processSet(set, true)
      end
      logger.info "Terminei o update"
    end
    head 200
  end

end
