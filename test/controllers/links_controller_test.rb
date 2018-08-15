require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get links_path
    assert_response :success
    assert_not_nil assigns(:link)
    assert_equal Link.all, assigns(:links)
  end

  test "should post create" do
    assert_difference 'Link.count', 1 do
      post links_path, params: {
        link: {
          name: 'example',
          url: 'https://example.com'
        }
      }
    end
    assert_redirected_to link_path(Link.last)
  end

  test "should get show" do
    link = links(:valid)
    get link_path(link)
    assert_response :success
    assert_equal link, assigns(:link)
  end

  test "should get edit" do
    link = links(:valid)
    get edit_link_path(link)
    assert_response :success
    assert_equal link, assigns(:link)
  end

  test "should post update" do
    link = links(:valid)
    updates = { name: 'altavista', url: 'https://altavista.com' }

    patch link_path(link), params: { link: updates }
    link.reload

    assert_equal updates[:name], link.name
    assert_equal updates[:url], link.url
  end

  test "should get destroy" do
    link = links(:destroy)
    assert_difference 'Link.count', -1 do
      delete link_path(link)
    end
    assert_redirected_to links_path
  end

  test "should redirect to url" do
    link = links(:valid)
    get "/#{link.name}"
    assert_redirected_to link.url
  end
end
