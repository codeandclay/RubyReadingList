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
end
