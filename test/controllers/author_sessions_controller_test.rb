require 'test_helper'

class AuthorSessionsControllerTest < ActionController::TestCase
  setup do
    @author_session = author_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_session" do
    assert_difference('AuthorSession.count') do
      post :create, author_session: {  }
    end

    assert_redirected_to author_session_path(assigns(:author_session))
  end

  test "should show author_session" do
    get :show, id: @author_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author_session
    assert_response :success
  end

  test "should update author_session" do
    patch :update, id: @author_session, author_session: {  }
    assert_redirected_to author_session_path(assigns(:author_session))
  end

  test "should destroy author_session" do
    assert_difference('AuthorSession.count', -1) do
      delete :destroy, id: @author_session
    end

    assert_redirected_to author_sessions_path
  end
end
