# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :taggings
  has_many :entries, through: :taggings

  validates_presence_of :name
  validates :name, uniqueness: true
end
