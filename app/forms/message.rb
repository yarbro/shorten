class Message
  include ActiveModel::Model

  attr_accessor :number

  validates :number, presence: true, format: {
    with: /\A(\+0?1\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/, message: 'not a valid phone number' }
end
