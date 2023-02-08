# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  plural_name   :string           not null
#  singular_name :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories.first
  end

  test "category names are capitalized correctly" do
    @category.update(plural_name: "cATEGORies", singular_name: "CATEgory")

    assert_equal "Categories", @category.plural_name
    assert_equal "Category", @category.singular_name
  end
end
