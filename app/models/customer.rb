class Customer < ApplicationRecord
    has_many :facilities, dependent: :destroy
    has_many :operations, dependent: :destroy
    has_many :contacts, dependent: :destroy

    has_and_belongs_to_many :operations, dependent: :destroy
    attribute :operation_ids, dependent: :destroy
end