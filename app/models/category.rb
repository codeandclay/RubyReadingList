# == Schema Information
#
# Table name: categories
#
#  id            :bigint           not null, primary key
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

  def entry_count
    entries.count
  end

  def empty?
    entries.count.zero?
  end

  def name
    return plural_name if (entries.count > 1 || entries.count.zero?)

    singular_name
  end
end
