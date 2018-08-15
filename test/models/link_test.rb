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

  test 'has a unique name' do
    link = Link.create(name: 'yahoo', url: 'https://yahoo.com')
    link = Link.new(name: 'yahoo', url: 'https://yahoo.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]
  end

  test 'does not allow names on blacklist' do
    link = Link.new(name: 'link', url: 'https://twitter.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]

    link = Link.new(name: 'links', url: 'https://twitter.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]
  end

  test 'has a url safe name' do
    link = Link.new(name: '#$$name$$#', url: 'https://microsoft.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]

    link = Link.new(name: 'invalid // name', url: 'https://microsoft.com')
    assert link.invalid?
    assert_not_nil link.errors[:name]
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
