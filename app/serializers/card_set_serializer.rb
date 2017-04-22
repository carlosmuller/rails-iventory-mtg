class CardSetSerializer < ActiveModel::Serializer
  attributes :mid
  belongs_to :card
end
