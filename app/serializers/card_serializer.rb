class CardSerializer < ActiveModel::Serializer
  attributes :name, :colors, :cost, :supertypes, :subtypes, :types, :text, :mids, :img

  @LAST_VALID_MID = 0

  def mids
    mids = []
    object.card_sets.each do |cs|
      if cs.mid
        mids << cs.mid
        @LAST_VALID_MID = cs.mid
      end
    end
    mids
  end

  def img
    BASE_IMAGE_URI % [@LAST_VALID_MID]
  end
end
