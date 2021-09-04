class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :fantasyName
      t.string :customerName
      t.string :taxId
      t.boolean :status
      t.string :stateRegistration

      t.timestamps
    end
  end
end
