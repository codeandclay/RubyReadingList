# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
#  entries_count :integer          default(0)
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

  test "returns plural name correctly" do
    assert_equal "Books", @category.name

    assert_equal "Tapes", categories(:category_2).name
  end

  test "returns singular name correctly" do
    Entry.first.update(category: categories(:category_3))

    assert_equal "Article", categories(:category_3).name
  end
end
