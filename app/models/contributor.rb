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
#
class Contributor < ApplicationRecord
end
