# == Schema Information
#
# Table name: links
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  url        :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_name  (name) UNIQUE
#

class Link < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
end
