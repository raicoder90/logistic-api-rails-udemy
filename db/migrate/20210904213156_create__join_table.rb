class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :customers, :operations do |t|
      t.index :customer_id
      t.index :operation_id
    end
  end
end
