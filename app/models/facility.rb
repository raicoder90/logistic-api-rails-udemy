class Facility < ApplicationRecord
  belongs_to :customer, optional: true
end
