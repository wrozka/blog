require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content) }

  describe "#publish" do
    it "returns all published posts in reverse chrononlogical order" do
      oldest = create(:post, created_at: 3.days.ago)
      newest = create(:post, created_at: 1.day.ago)
      middle = create(:post, created_at: 2.days.ago)

      Post.published.should == [newest, middle, oldest]
    end
  end
end
