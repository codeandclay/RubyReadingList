# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags.first
  end

  test "tags are downcased" do
    @tag.update(name: "ruBy")

    assert_equal "ruby", @tag.name
  end
end
