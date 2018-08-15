class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid URL") unless url_valid?(value)
  end

  # Basic url validation
  # -- we could be more strict but that may inhibit valid input
  # -- better to be less strict and gracefully handle errors
  def url_valid?(url)
    url = URI.parse(url) rescue false
    url.kind_of?(URI::HTTP)
  end
end
