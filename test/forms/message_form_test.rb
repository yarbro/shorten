require 'test_helper'

class MessageFormTest < ActiveSupport::TestCase
  test 'valid message' do
    message = Message.new(number: '512-555-0000')
    assert message.valid?
  end

  test 'invalid without number' do
    message = Message.new
    assert message.invalid?
    assert_not_nil message.errors[:number]
  end

  test 'allows valid numbers' do
    message = Message.new(number: '5124440000')
    assert message.valid?

    message = Message.new(number: '512-444-0000')
    assert message.valid?

    message = Message.new(number: '+1 5124440000')
    assert message.valid?

    message = Message.new(number: '(512) 444-0000')
    assert message.valid?
  end
end
