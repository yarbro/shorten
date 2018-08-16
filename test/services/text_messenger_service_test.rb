require 'test_helper'

class TextMessengerServiceTest < ActiveSupport::TestCase
  test 'should send a text message' do
    message = TextMessenger.new('512-444-0000', 'https://google.com').deliver
    assert message
  end
end
