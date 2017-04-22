class SetsSerializer < ActiveModel::Serializer
  attributes :name, :cards

  def cards
    cards = []
    object.card_sets.each do |cs|
      cards << {'name': cs.card.name , 'mid': cs.mid }
    end
    cards
  end
end
