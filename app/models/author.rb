# == Schema Information
#
# Table name: authors
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  has_many :authorships, dependent: :destroy
  has_many :entries, through: :authorships

  validates_presence_of :name
  validates :name, uniqueness: true
end
