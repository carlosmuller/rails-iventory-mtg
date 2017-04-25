class Card < ApplicationRecord
  has_many :card_sets
  has_many :sets, through: :card_sets

  # Update a card adding new informations that are on json
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def merge (json)
    addArrays json
    setMaxMid json['multiverseid']
  end

  # Create a card from json and add the set to the card
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def createFromJson(json)
    self.name = json['name']
    self.text = json['text']
    self.cost = json['manaCost']
    setMaxMid json['multiverseid']
    addArrays json
  end

  # @param [JSON] json object to update the arrays objects
  def addArrays json
    createOrUpdateProperty('color', json)
    createOrUpdateProperty('supertypes', json)
    createOrUpdateProperty('types', json)
    createOrUpdateProperty('subtypes', json)
  end


  # Method if mid and self.maxmid is null set to 0
  # @param [Integer] mid
  def setMaxMid mid
    mid ||= 0
    self.maxmid ||= 0
    if self.maxmid <= mid
      self.maxmid = mid
    end
  end

  # Method to set or update the property from the card based on value from json
  # @param [String] propertyName
  # @param [JSONObject] json
  def createOrUpdateProperty(propertyName, json)
    jsonProperty = json[propertyName]
    property = self.instance_variable_get("@#{propertyName}")
    property ||= Array.new
    if jsonProperty
      jsonProperty.each do |jsonValue|
        setProperty(jsonValue, property, propertyName)
      end
    end
  end


  # @param [Object] jsonValue the value to set in property
  # @param [Array] property the property from card to put the value
  # @param [String] propertyName the name of the property
  def setProperty(jsonValue, property, propertyName)
    if !jsonValue.in? property
      property << jsonValue
      self.send("#{propertyName}=", property)
    end
  end

end
