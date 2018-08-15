require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test 'valid link' do
    link = Link.new(name: 'ticketbud', url: 'https://ticketbud.com')
    assert link.valid?
  end

  test 'invalid without name' do
    link = Link.new(url: 'https://ticketbud.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]
  end

  test 'invalid without url' do
    link = Link.new(name: 'ticketbud')
    assert link.invalid?
    assert_not_nil link.errors[:url]
  end

  test 'has a valid url' do
    link = Link.new(name: 'invalid', url: 'invalidurl')
    assert link.invalid?
    assert_not_nil link.errors[:url]

    link = Link.new(name: 'invalid', url: 'invalid.url')
    assert link.invalid?
    assert_not_nil link.errors[:url]
  end
end
