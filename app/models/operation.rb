class Operation < ApplicationRecord
    has_and_belongs_to_many :customers

    validates :description, presence: { message: "Operation required!" }
    validates :description, uniqueness: {
        message: ->(object, data) do
            "Operation '#{data[:value]}' duplicated!"
        end
    }
end