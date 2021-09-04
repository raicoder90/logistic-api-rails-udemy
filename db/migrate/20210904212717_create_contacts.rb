class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :description
      t.string :email
      t.string :telephone01
      t.string :telephone02
      t.boolean :main
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
