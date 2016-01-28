require 'test_helper'

class MoviepostsControllerTest < ActionController::TestCase
  setup do
    @moviepost = movieposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movieposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moviepost" do
    assert_difference('Moviepost.count') do
      post :create, moviepost: { content: @moviepost.content }
    end

    assert_redirected_to moviepost_path(assigns(:moviepost))
  end

  test "should show moviepost" do
    get :show, id: @moviepost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moviepost
    assert_response :success
  end

  test "should update moviepost" do
    patch :update, id: @moviepost, moviepost: { content: @moviepost.content }
    assert_redirected_to moviepost_path(assigns(:moviepost))
  end

  test "should destroy moviepost" do
    assert_difference('Moviepost.count', -1) do
      delete :destroy, id: @moviepost
    end

    assert_redirected_to movieposts_path
  end
end
