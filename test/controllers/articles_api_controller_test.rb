require "test_helper"

class ArticlesApiControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
  end


  #manque verif erreur message
  

  #--Show----------------------------------------------------------------------------------------

    test "status 200 when requesting all article of article" do  
      get "/api/articles"
      assert_response(200)
    end

    test "status 200 when requesting 1 article of article" do  
      get "/api/articles/1"
      assert_response(200)
    end

    test "raises RecordNotFound when article not existing" do
      assert_raises(ActiveRecord::RecordNotFound) do
          get '/api/articles/3'
      end
    end


  #--Create--------------------------------------------------------------------------------------

    test "status 200(ok) when creating article valid " do
      post "/api/articles", params: { article:{ title: "article1", body: "Test body assez long", status: "public"}}
      assert_response(200)
    end

    test "status 406(not_acceptable) when creating article invalid no title" do
      post "/api/articles", params: { article:{ body: "Test body assez long", status: "public"}}
      assert_response(406)
    end

    test "status 406(not_acceptable) when creating article invalid no body" do
      post "/api/articles", params: { article:{ title: "com 1", status: "public"}}
      assert_response(406)
    end

    test "status 406(not_acceptable) when creating article invalid no status" do
      post "/api/articles", params: { article:{ title: "com 1", body: "Test body assez long"}}
      assert_response(406)
    end

    test "status 406(not_acceptable) when creating article invalid - invalid status" do
      post "/api/articles", params: { article:{ title: "com 1", body: "Test body assez long", status: "poil"}}
      assert_response(406)
    end

    

  #--Delete---------------------------------------------------------------------------------------

    test "status 200(ok) when deleting article valid " do
      delete "/api/articles/1"
      assert_response(200)
    end

    test "status 404(not_found) when deleting comment invalid" do
      assert_raises(ActiveRecord::RecordNotFound) do
        delete "/api/articles/3"
      end
    end

end
