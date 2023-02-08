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
#
class Entry < ApplicationRecord
end
