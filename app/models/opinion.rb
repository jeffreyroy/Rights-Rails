class Opinion < ApplicationRecord
  belongs_to :case
  belongs_to :justice
  # Need to confirm that this works:
  delegate :issue, to: :case
end
