require 'test_helper'

class ContentItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_item = content_items(:one)
  end

  test "should get index" do
    get content_items_url, as: :json
    assert_response :success
  end

  test "should create content_item" do
    assert_difference('ContentItem.count') do
      post content_items_url, params: { content_item: { author: @content_item.author, content: @content_item.content, published_date: @content_item.published_date, summary: @content_item.summary, title: @content_item.title } }, as: :json
    end

    assert_response 201
  end

  test "should show content_item" do
    get content_item_url(@content_item), as: :json
    assert_response :success
  end

  test "should update content_item" do
    patch content_item_url(@content_item), params: { content_item: { author: @content_item.author, content: @content_item.content, published_date: @content_item.published_date, summary: @content_item.summary, title: @content_item.title } }, as: :json
    assert_response 200
  end

  test "should destroy content_item" do
    assert_difference('ContentItem.count', -1) do
      delete content_item_url(@content_item), as: :json
    end

    assert_response 204
  end
end
