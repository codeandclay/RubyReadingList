# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_authors_on_name  (name) UNIQUE
#
require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
