require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'valid link' do
    link = Link.new(name: 'ticketbud', url: 'https://ticketbud.com')
    assert link.valid?
  end

  test 'invalid without name' do
    link = Link.new(url: 'https://ticketbud.com')
    assert link.invalid?
  end

  test 'invalid without url' do
    link = Link.new(name: 'ticketbud')
    assert link.invalid?
  end
end
