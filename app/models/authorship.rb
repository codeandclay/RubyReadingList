# == Schema Information
#
# Table name: authorships
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint
#  entry_id   :bigint
#
# Indexes
#
#  index_authorships_on_author_id  (author_id)
#  index_authorships_on_entry_id   (entry_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => authors.id)
#  fk_rails_...  (entry_id => entries.id)
#
class Authorship < ApplicationRecord
  belongs_to :author
  belongs_to :entry
end
