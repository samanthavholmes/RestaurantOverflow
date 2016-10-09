require 'rails_helper'

RSpec.describe Question, type: :model do
  before(:each) do
    @user = User.create(first_name: "Dasiy", last_name: "Parker", email: "daisyp@gmai.com", password: "password")
    @question = Question.create(title: "question title", body: "question body", user: @user)
    @answer = Answer.create(body: "answer body", user: @user, question_id: @question.id)
    @comment = Comment.create(body: "comment body", user: @user, commentable_type: "Question", commentable_id: @question.id)
    @vote = Vote.create(value: 1, user: @user)
  end

  it "is valid with valid attributes" do
    expect(@question).to be_valid
  end

  it "is not valid without a title" do
    @question.title = nil
    expect(@question).to_not be_valid
  end

  it "is not valid without a body" do
    @question.body = nil
    expect(@question).to_not be_valid
  end

  it 'has an associated user' do
    expect(@question.user).to eq [@user]
  end

  it 'has associated answers' do
    expect(@question.answers).to eq [@answer]
  end

  it 'has associated comments' do
    expect(@question.comments).to eq [@comment]
  end

  it 'has associated votes' do
    expect(@question.votes).to eq [@vote]
  end

end
