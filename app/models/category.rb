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
class Category < ApplicationRecord
  has_many :entries

  validates_presence_of :plural_name, :singular_name
  validates :plural_name, :singular_name, uniqueness: true

  before_save { self.plural_name = plural_name.downcase.capitalize }
  before_save { self.singular_name = singular_name.downcase.capitalize }

  attribute :name, :string

  def entry_count
    entries.size
  end

  def empty?
    entries.size.zero?
  end

  def name
    return plural_name if (entries.size > 1 || entries.size.zero?)

    singular_name
  end

  def slug
    plural_name.downcase
  end
end
