require 'rails_helper'

RSpec.describe Answer, type: :model do
  before(:each) do
    @user = User.create(first_name: "Dasiy", last_name: "Parker", email: "daisyp@gmai.com", password: "password")
    @question = Question.create(title: "question title", body: "question body", user: @user)
    @answer = Answer.create(body: "answer body", user: @user, question_id: @question.id)
    @comment = Comment.create(body: "comment body", user: @user, commentable_type: "Answer", commentable_id: @answer.id)
    @vote = Vote.create(value: 1, user: @user)
  end

  it "is valid with valid attributes" do
    expect(@answer).to be_valid
  end

  it "is not valid without a body" do
    @answer.body = nil
    expect(@answer).to_not be_valid
  end

  it 'has an associated user' do
    expect(@answer.user).to eq [@user]
  end

  it 'has associated comments' do
    expect(@answer.comments).to eq [@comment]
  end

  it 'has associated votes' do
    expect(@answer.votes).to eq [@vote]
  end

end
