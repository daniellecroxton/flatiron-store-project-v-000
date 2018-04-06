class AddDefaultValueToCartStatus < ActiveRecord::Migration
  def change
    change_column :carts, :status, :string, :default => "unsubmitted"
  end
end
