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
class Entry < ApplicationRecord
  STATES = %w(unpublished published deleted)
  has_many :authorships, dependent: :destroy
  has_many :authors, through: :authorships

  has_many :taggings
  has_many :tags, through: :taggings

  has_many :contributors

  belongs_to :category, counter_cache: :entries_count

  validates_presence_of :authors, :description, :tags, :title, :url

  scope :by_category, ->(category) do
    return if category.nil?

    joins(:category).where(
      categories: { plural_name: category.capitalize }
    )
  end

  scope :by_tags, ->(tags) do
    return if tags.nil? || tags.empty?

    joins(:tags).where(
      tags: { name: tags }
    )
  end

  def self.last_updated
    Entry.order("created_at DESC").first.updated_at
  end

  STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end
end
