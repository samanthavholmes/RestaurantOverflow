require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(first_name: "Daisy", last_name: "Parker", email: "daisyp@gmai.com", password: "password")
    @question = Question.create(title: "question title", body: "question body", user: @user)
    @answer = Answer.create(body: "answer body", user: @user, question_id: @question.id)
    @question_comment = Comment.create(body: "comment body", user: @user, commentable_type: "Question", commentable_id: @question.id)
    @answer_comment = Comment.create(body: "comment body", user: @user, commentable_type: "Answer", commentable_id: @answer.id)
    @vote = Vote.create(value: 1, user: @user, voteable_type: "Comment", voteable_id: @question_comment.id)
  end

  it "is valid with valid attributes" do
    expect(@question_comment).to be_valid
  end

  it "is not valid without a body" do
    @question_comment.body = nil
    expect(@question_comment).to_not be_valid
  end

  it 'has an associated user' do
    expect(@question_comment.user).to eq @user
  end

  it 'can have an associated question' do
    expect(@question_comment.commentable).to eq @question
  end

  it 'can have an associated answer' do
    expect(@answer_comment.commentable).to eq @answer
  end

  it 'has associated votes' do
    expect(@question_comment.votes).to eq [@vote]
  end
end
