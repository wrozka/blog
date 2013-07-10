require 'spec_helper'

describe PostAdder do
  it "raises validation error with invalid records" do
    expect {
      PostAdder.add(title: "")
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "returns the added blog post with valid details" do
    post = PostAdder.add(title: "Foo", author: "The Bars", content: "Baz")

    post.title.should == "Foo"
    post.author.should == "The Bars"
    post.content.should == "Baz"
  end
end
