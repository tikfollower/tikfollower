class CreateSubscriptionMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_masters do |t|
      t.string :subscription_id
      t.float :price
      t.integer :stars

      t.timestamps
    end
  end
end
