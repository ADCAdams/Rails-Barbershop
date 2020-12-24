class AddAuthIdToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :authID, :integer
  end
end
