class CardSet < ApplicationRecord
  belongs_to :card
  belongs_to :sets
end
