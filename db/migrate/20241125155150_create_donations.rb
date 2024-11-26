class CreateDonations < ActiveRecord::Migration[7.1]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :amount
      t.string :state
      t.string :donation_sku
      t.string :checkout_session_id

      t.timestamps
    end
  end
end
