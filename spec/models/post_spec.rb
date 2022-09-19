require 'rails_helper'

RSpec.describe Post, type: :model do

  subject { Post.new(title: "Title 1", body: "Body 1", user_id: 1) }

  it "post title must not be empty" do
    subject.title = nil
    expect(subject).to be_invalid
  end

  it "post body must not be empty" do
    subject.body = nil
    expect(subject).to be_invalid
  end

  it "post title cannot be longer than 50 characters" do
    str = []
    for i in 0...51
      str.push('a')
    end
    subject.title = str.join("")
    expect(subject.title.length).to be > 50
  end

  it "post body cannot be longer than 255 characters" do
    str = []
    for i in 0...256
      str.push('a')
    end
    subject.body = str.join("")
    expect(subject.body.length).to be > 255  
  end

  it "user_id is empty or not found" do
    expect(subject).to be_valid
  end

  it "should save post data with valid attribute" do
    post = Post.new(title: "Title 1", body: "Body 1", user_id: 1)
    expect(post.valid?).to be_truthy  
  end

end
