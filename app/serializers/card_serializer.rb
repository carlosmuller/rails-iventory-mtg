class CardSerializer < ActiveModel::Serializer
  attributes :name, :colors, :cost, :supertypes, :subtypes, :types, :text, :mids, :img


  def mids
    mids = []
    object.card_sets.each do |cs|
      if cs.mid
        mids << cs.mid
      end
    end
    mids
  end

  def img
    BASE_IMAGE_URI % [object.maxmid]
  end
end
