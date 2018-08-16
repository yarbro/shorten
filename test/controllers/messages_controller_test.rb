require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test 'should post create' do
    link = links(:valid)

    post messages_path(link), params: {
      message: {
        number: '512-555-5555'
      }
    }

    assert_redirected_to link_path(link)
    assert_equal 'SMS sent successfully!', flash[:notice]
  end
end
