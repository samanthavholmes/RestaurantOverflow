require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @user = User.create(first_name: "Daisy", last_name: "Parker", email: "daisyp@gmai.com", password: "password")
    @question = Question.create(title: "question title", body: "question body", user: @user)
    @answer = Answer.create(body: "answer body", user: @user, question_id: @question.id)
    @comment = Comment.create(body: "comment body", user: @user, commentable_type: "Answer", commentable_id: @answer.id)
    @question_vote = Vote.create(value: 1, user: @user, voteable_type: "Question", voteable_id: @question.id)
    @answer_vote = Vote.create(value: 1, user: @user, voteable_type: "Answer", voteable_id: @answer.id)
    @comment_vote = Vote.create(value: 1, user: @user, voteable_type: "Comment", voteable_id: @comment.id)
  end

  it "is valid with valid attributes" do
    expect(@question_vote).to be_valid
  end

  it "is not valid without a body" do
    @question_vote.value = nil
    expect(@question_vote).to_not be_valid
  end

  it 'has an associated user' do
    expect(@question_vote.user).to eq @user
  end

  it 'can have an associated comment' do
    expect(@comment_vote.voteable).to eq @comment
  end

  it 'can have an associated question' do
    expect(@question_vote.voteable).to eq @question
  end

  it 'can have an associated answer' do
    expect(@answer_vote.voteable).to eq @answer
  end
end
