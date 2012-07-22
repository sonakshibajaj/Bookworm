class AddPurchaseDateToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :date_of_purchase, :date
  end

  def self.down
    remove_column :books, :date_of_purchase
  end
end
