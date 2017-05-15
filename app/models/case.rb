class Case < ApplicationRecord
  belongs_to :issue
  has_many :opinions
  has_many :justices, through: :opinions

  validates :name, presence: true
  validates :date_decided, presence: true
  validates :cite1, presence: true
end
