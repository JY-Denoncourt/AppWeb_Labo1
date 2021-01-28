require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  
  test "comment created everything right" do
    comment = Comment.new(commenter: "poil", body: "body test a plus de 10 carac", status: "public", article_id: 1)
    assert comment.save
  end


  test "article not created without commenter" do
    comment = Comment.new(body: "body test a plus de 10 carac", status: "public", article_id: 1)
    assert_not comment.save
  end


  test "article not created without body" do
    comment = Comment.new(commenter: "poil", status: "public", article_id: 1)
    assert_not comment.save
  end


  test "article not created without status" do
    comment = Comment.new(commenter: "poil", body: "body test a plus de 10 carac", article_id: 1)
    assert_not comment.save
  end


  test "article not created body too short" do
    comment = Comment.new(commenter: "poil", body: "body test", status: "public", article_id: 1)
    assert_not comment.save
  end


  test "article not created status invalid" do
    comment = Comment.new(commenter: "poil", body: "body test a plus de 10 carac", status: "poil", article_id: 1)
    assert_not comment.save 
  end


end
