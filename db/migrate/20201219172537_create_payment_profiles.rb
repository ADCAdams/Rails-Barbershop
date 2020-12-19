class CreatePaymentProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_profiles do |t|
      t.string :cc_name
      t.integer :cc_number
      t.belongs_to :customer, foreign_key: true

      t.timestamps
    end
  end
end
