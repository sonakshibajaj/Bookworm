# == Schema Information
#
# Table name: books
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  description       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  author            :string(255)
#  ISBN              :string(255)
#  checked_in        :boolean
#  borrower          :string(255)
#  cost              :float
#  date_of_purchase  :date
#  date_of_borrowing :date
#

require 'spec_helper'

describe Book do
	
	before(:each) do
		@book_attr = {:name => "Test Book Name", :description => "Test Book Desc", :author => "Test Author", :ISBN => "1-123-4", :checked_in => true, :cost => 100, :date_of_purchase => Date.new(2012,1,1)}
		@book = Book.new(@book_attr)
	end
	
	it "should have the all the attribute" do
		@book.should respond_to(:name)
		@book.should respond_to(:description)
		@book.should respond_to(:author)
		@book.should respond_to(:ISBN)
		@book.should respond_to(:checked_in)
		@book.should respond_to(:borrower)
		@book.should respond_to(:cost)
	end

	
	
	it "should not have a blank name" do
		invalid_book = Book.new(@book_attr.merge(:name => ""))
		invalid_book.should_not be_valid
	end
	
	it "should not have a blank author" do
		invalid_book = Book.new(@book_attr.merge(:author => ""))
		invalid_book.should_not be_valid
	end
	
	it "should not have a blank ISBN" do
		invalid_book = Book.new(@book_attr.merge(:ISBN => ""))
		invalid_book.should_not be_valid
	end
	
	it "should not have date of purchase as nil" do
		invalid_book = Book.new(@book_attr.merge(:date_of_purchase => nil))
		invalid_book.should_not be_valid
	end
	
	it "should not have cost as nil" do
		invalid_book = Book.new(@book_attr.merge(:cost => nil))
		invalid_book.should_not be_valid
	end
	
	it "should not have borrower as blank if checked_in is false" do
		invalid_book = Book.new(@book_attr.merge(:checked_in => false, :borrower => "", :date_of_borrowing => Date.new(2012,1,1)))
		invalid_book.should_not be_valid
	end
	
	it "should not have date_of_borrowing as nil if checked_in is false" do
		invalid_book = Book.new(@book_attr.merge(:checked_in => false, :date_of_borrowing => nil, :borrower => "Test Borrower"))
		invalid_book.save
		invalid_book.should_not be_valid
	end
	
end
