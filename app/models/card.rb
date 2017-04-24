class Card < ApplicationRecord
  has_many :card_sets
  has_many :sets, through: :card_sets

  # Update a card adding new informations that are on json
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def merge (json)
    addArrays json
  end

  # Create a card from json and add the set to the card
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def createFromJson(json)
    self.name = json['name']
    self.text = json['text']
    self.cost = json['manaCost']
    addArrays json
  end

  # @param [JSON] json object to update the arrays objects
  def addArrays json
    createOrUpdateProperty('color', json)
    createOrUpdateProperty('supertypes', json)
    createOrUpdateProperty('types', json)
    createOrUpdateProperty('subtypes', json)
  end

  def createOrUpdateProperty(propertyName, json)
    jsonProperty = json[propertyName]
    property = self.instance_variable_get("@#{propertyName}")
    property ||= Array.new
    if jsonProperty
      jsonProperty.each do |jsp|
        setProperty(jsp, property, propertyName)
      end
    end
  end

  def setProperty(jsp, property, propertyName)
    if !jsp.in? property
      property << jsp
      self.send("#{propertyName}=", property)
    end
  end

end
