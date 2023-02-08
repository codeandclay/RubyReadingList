# == Schema Information
#
# Table name: entries
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  metadata    :jsonb
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
class Entry < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :contributors

  belongs_to :category

  validates_presence_of :authors, :description, :tags, :title, :url
end
