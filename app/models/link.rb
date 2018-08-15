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
  validate :validate_url

  private

  # Basic url validation
  # -- we could be more strict but that may inhibit valid input
  # -- better to be less strict and gracefully handle errors
  def validate_url
    uri = URI.parse(url) rescue false
    unless uri.kind_of?(URI::HTTP) || uri.kind_of?(URI::HTTPS)
      errors.add(:url, 'not a valid url')
    end
  end
end
