class AddCostToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :cost, :float
  end

  def self.down
    remove_column :books, :cost
  end
end
