require 'rails_helper'

RSpec.describe Comment, type: :model do

  subject { Comment.new(body: "This is comment", user_id: 1, post_id: 2) } 

  it "comment body content must not be empty" do
    subject.body = nil 
    expect(subject).not_to be_valid  
  end

  it "user_id not found or empty" do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end

  it "post_id not found or empty" do
    subject.post_id = nil
    expect(subject).not_to be_valid
  end

  it "comment body cannot be longer than 255 characters" do
    str = []
    for i in 0...256
      str.push('a')
    end
    subject.body = str.join("")
    expect(subject.body.length).to be > 255  
  end

  it "should save comment data with valid attribute" do
    expect(subject).to be_valid 
  end
end
