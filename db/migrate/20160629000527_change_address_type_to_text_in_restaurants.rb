class ChangeAddressTypeToTextInRestaurants < ActiveRecord::Migration
  def change
    change_column :restaurants, :address, :text
  end
end
