class Issue < ApplicationRecord
  has_many :cases
  has_many :opinions, through: :cases
  has_many :justices, through: :opinions
  has_and_belongs_to_many :users
  validates :name, presence: true

end
