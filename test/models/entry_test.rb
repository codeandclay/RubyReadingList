# == Schema Information
#
# Table name: entries
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  metadata    :jsonb
#  state       :string           default("unpublished"), not null
#  title       :string           not null
#  url         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint
#
# Indexes
#
#  index_entries_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
require "test_helper"

class EntryTest < ActiveSupport::TestCase
  test "an entry has a state" do
    assert entries.first.unpublished?
    refute entries.first.published?

    entries.first.published!
    assert entries.first.published?

    refute entries.first.deleted?

    entries.first.deleted!
    assert entries.first.deleted?
  end
end
