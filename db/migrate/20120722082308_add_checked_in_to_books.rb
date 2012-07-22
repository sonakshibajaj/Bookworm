class AddCheckedInToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :checked_in, :boolean
  end

  def self.down
    remove_column :books, :checked_in
  end
end
