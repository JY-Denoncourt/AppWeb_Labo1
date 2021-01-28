require "test_helper"

class CommentsApiControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end
 
  # Note :
    # Le Model fixture a article (id : 1) et 2 comment dedans


  # Test : 
    # Show de all article.comments ok
    # Show de 1 article.comment ok
    # Show de 1 article.comment not found
    # Create de 1 article.comment ok
    # Create de 1 article.comment not ok 
    # Delete de 1 article.comment ok
    # Delete de 1 article.comment not ok

#--Show----------------------------------------------------------------------------------------

  test "status 200 when requesting all comments of article" do  
    get "/api/articles/1/comments"
    assert_response(200)
  end

  test "status 200 when requesting 1 comments of article" do  
    get "/api/articles/1/comments/2"
    assert_response(200)
  end

  test "raises RecordNotFound when article not existing" do
    assert_raises(ActiveRecord::RecordNotFound) do
        get '/api/articles/1/comments/3'
    end
  end


#--Create--------------------------------------------------------------------------------------

  test "status 200(ok) when creating comment valid " do
    post "/api/articles/1/comments", params: { comment:{ commenter: "com1", body: "Test body assez long", status: "public"}}
    assert_response(200)
  end

  test "status 406(not_acceptable) when creating comment invalid no commenter" do
    post "/api/articles/1/comments", params: { comment:{ body: "Test body assez long", status: "public"}}
    assert_response(406)
  end

  test "status 406(not_acceptable) when creating comment invalid no body" do
    post "/api/articles/1/comments", params: { comment:{ commenter: "com 1", status: "public"}}
    assert_response(406)
  end

  test "status 406(not_acceptable) when creating comment invalid no status" do
    post "/api/articles/1/comments", params: { comment:{ commenter: "com 1", body: "Test body assez long"}}
    assert_response(406)
  end

  test "status 406(not_acceptable) when creating comment invalid - invalid status" do
    post "/api/articles/1/comments", params: { comment:{ commenter: "com 1", body: "Test body assez long", status: "poil"}}
    assert_response(406)
  end

#--Delete---------------------------------------------------------------------------------------

  test "status 200(ok) when deleting comment valid " do
    delete "/api/articles/1/comments/1"
    assert_response(200)
  end

  test "status 404(not_found) when deleting comment invalid" do
    assert_raises(ActiveRecord::RecordNotFound) do
      delete "/api/articles/1/comments/3"
    end
  end




end
