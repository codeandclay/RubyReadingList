# == Schema Information
#
# Table name: contributors
#
#  id          :bigint           not null, primary key
#  email       :string
#  give_credit :boolean
#  name        :string
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  entry_id    :bigint
#
# Indexes
#
#  index_contributors_on_entry_id  (entry_id)
#
# Foreign Keys
#
#  fk_rails_...  (entry_id => entries.id)
#
class Contributor < ApplicationRecord
  belongs_to :entry

  before_save { self.email = email.downcase.strip }
end
