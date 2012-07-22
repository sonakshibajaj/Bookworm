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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
