require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :found
  end

  test "should get new" do
    get :new
    assert_response :found
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { author: @post.author, body: @post.body, title: @post.title }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :found
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
