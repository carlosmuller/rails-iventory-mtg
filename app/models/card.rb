class Card < ApplicationRecord

  # Update a card adding new informations that are on json
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def merge (json, setName)
    self.mid << json['multiverseid']
    self.sets << setName
    addArrays json
  end

  # Create a card from json and add the set to the card
  # @param [JSON] json a json object with properties form mtgjson.com
  # @param [String] setName the name of the set
  def createFromJson(json, setName)
    self.name = json['name']
    self.text = json['text']
    self.cost = json['manaCost']
    self.mid =[]
    self.mid << json['multiverseid']
    self.sets = []
    self.sets << setName
    addArrays json
  end


  # @param [JSON] json object to update the arrays objects
  def addArrays json
    if json['colors']
      json['colors'].each do |color|
        if !color.in? self.colors
          self.colors << color
        end
      end
    end
    if json['supertypes']
      json['supertypes'].each do |supertype|
        if !supertype.in? self.supertypes
          self.subtypes << supertype
        end
      end
    end
    if json['types']
      json['types'].each do |type|
        if !type.in? self.types
          self.types << type
        end
      end
    end
    if json['subtypes']
      json['subtypes'].each do |subtype|
        if subtype.in? self.subtypes
          self.subtypes << subtype
        end
      end
    end
  end
end
