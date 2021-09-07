class Facility < ApplicationRecord
  belongs_to :customer, optional: true

  validates :city, :presence => true
  validates :state, presence: { message: "State required!" }
  validates :cep, presence: { message: "CEP required!" }
  validates :country, presence: { message: "Country required!" }
  validates :description, presence: { message: "Description required!" }
  validates :number, presence: { message: "Number required!" }
end