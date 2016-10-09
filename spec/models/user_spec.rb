require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(first_name: "Dasiy", last_name: "Parker", email: "daisyp@gmai.com", password: "password")
    @question = Question.create(title: "question title", body: "question body", user: @user)
    @answer = Answer.create(body: "answer body", user: @user, question_id: @question.id)
    @comment = Comment.create(body: "comment body", user: @user)
    @vote = Vote.create(value: 1, user: @user)
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end

  it "is not valid without a first name" do
    @user.first_name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without a last name" do
    @user.last_name = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'has associated questions' do
    expect(@user.questions).to eq [@question]
  end

  it 'has associated answers' do
    expect(@user.answers).to eq [@answer]
  end

  it 'has associated comments' do
    expect(@user.comments).to eq [@comment]
  end

  it 'has associated votes' do
    expect(@user.votes).to eq [@vote]
  end
end
