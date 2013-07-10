require 'spec_helper'

feature 'Commenting on blog posts' do
  scenario 'Adding a comment to a blog post' do
    post = create(:post)
    blog_post = open_blog_post(post)

    blog_post.comment(author: "Alice", text: "nice blog post")

    blog_post.should_have_comment(author: "Alice", text: "nice blog post")
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

  def comment(author: raise, text: raise)
    within_post do
      fill_in "Comment", with: text
      fill_in "Author", with: author
      click_button "Add comment"
    end
  end

  def should_have_comment(author: raise, text: raise)
    within_post do
      page.should have_content(author)
      page.should have_content(text)
    end
  end

  private

  def within_post(&block)
    within("#post-#{post.id}", &block)
  end
end
