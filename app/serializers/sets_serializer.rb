class SetsSerializer < ActiveModel::Serializer
  attributes :name
  has_many :card_sets
  has_many :card, through: :card_sets
end
