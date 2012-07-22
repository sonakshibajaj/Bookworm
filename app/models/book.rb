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

class Book < ActiveRecord::Base
	attr_accessible :name, :description, :author, :ISBN, 
									:cost, :checked_in, :borrower, :date_of_borrowing,
									:date_of_purchase
	
	validate :is_date_of_borrowing_nil
	validate :is_borrower_blank
	
	validates :name, :presence => true
	validates :author, :presence => true
	validates :ISBN, :presence => true
	validates :cost, :presence => true
	validates :date_of_purchase, :presence => true
	
	
	
	private
	
		def is_date_of_borrowing_nil
			if (self.checked_in == false && self.date_of_borrowing.nil?)
				errors.add(:date_of_borrowing, "Date of borrowing should not be nil")
				return false
			end
		end
		
		def is_borrower_blank
			if (self.checked_in == false && self.borrower.blank?)
				errors.add(:borrower, "Borrower should not be blank")
				return false
			end
		end
end
