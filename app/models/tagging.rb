# == Schema Information
#
# Table name: taggings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  entry_id   :bigint
#  tag_id     :bigint
#
# Indexes
#
#  index_taggings_on_entry_id  (entry_id)
#  index_taggings_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (entry_id => entries.id)
#  fk_rails_...  (tag_id => tags.id)
#
class Tagging < ApplicationRecord
  belongs_to :entry
  belongs_to :tag
end
