class AddBorrowedDateToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :date_of_borrowing, :date
  end

  def self.down
    remove_column :books, :date_of_borrowing
  end
end
