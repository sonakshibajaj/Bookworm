class AddBorrowerToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :borrower, :string
  end

  def self.down
    remove_column :books, :borrower
  end
end
