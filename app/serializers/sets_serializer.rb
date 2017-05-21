class SetsSerializer < ActiveModel::Serializer
  attributes :name, :cards

  def cards
    cards = []
    object.card_sets.each do |cs|
      mid = cs.mid
      cards << { 'name': cs.card.name, 'mid': mid, 'img': BASE_IMAGE_URI % [mid] }
    end
    cards
  end
end
