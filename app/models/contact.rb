class Contact < ApplicationRecord
  belongs_to :customer

  attribute :customer

end