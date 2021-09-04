class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :cep
      t.string :complement
      t.string :number
      t.string :city
      t.string :state
      t.string :country
      t.string :description
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
