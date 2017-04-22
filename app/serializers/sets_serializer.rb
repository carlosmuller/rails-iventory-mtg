class SetsSerializer < ActiveModel::Serializer
  attributes :name, :cards

  def cards
    cards = []
    object.card_sets.each do |cs|
      mid = cs.mid
      cards << {'name': cs.card.name , 'mid': mid, 'img': "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=#{mid}&type=card"}
    end
    cards
  end
end
