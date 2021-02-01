require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "article created everything right" do
    article = Article.new(title: "poil", body: "body test a plus de 10 carac", status: "public")
    assert article.save
  end


  test "article not created without title" do
    article = Article.new(body: "body test a plus de 10 carac", status: "public")
    assert_not article.save
  end


  test "article not created without body" do
    article = Article.new(title: "poil", status: "public")
    assert_not article.save
  end


  test "article not created without status" do
    article = Article.new(title: "poil", body: "body test a plus de 10 carac", status: "public")
    assert article.save
  end


  test "article not created body too short" do
    article = Article.new(title: "poil", body: "body test", status: "public")
    assert_not article.save
  end


  test "article not created status invalid" do
    article = Article.new(title: "poil", body: "body test a plus de 10 carac", status: "poil")
    assert_not article.save
  end

end
