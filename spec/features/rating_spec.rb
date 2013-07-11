require 'spec_helper'

feature "Rating blog posts" do
  scenario "average rating of a blog post shows up on the home page" do
    post = create(:post)
    blog_post = open_blog_post(post)

    blog_post.rate(1, 3, 5)

    blog_post.should_have_rating_of(3)
  end
end

def open_blog_post(post)
  home_page.open
  BlogPost.new(post)
end

class BlogPost < Page
  attr_reader :post

  def initialize(post)
    @post = post
  end

  def rate(*ratings)
    within_post do
      ratings.each do |rating|
        page.select(rating, from: "rating_value")
        click_button "Rate post"
      end
    end
  end

  def should_have_rating_of(rating)
    within_post do
      page.should have_content("Rating: #{rating}")
    end
  end

  private

  def within_post(&block)
    within("#post-#{post.id}", &block)
  end
end
