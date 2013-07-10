require 'spec_helper'

feature "Adding posts" do
  scenario "Added posts show up on the home page" do
    post = Post.new(author: "Joe", title: "Hello World!",
      content: "This is my first blog post.")

    home_page.open

    home_page.add_post(post)

    home_page.should_have_post(post)
  end
end
