def home_page
  HomePage.new
end

class HomePage < Page
  def open
    visit root_path
  end

  def add_post(post)
    click_link "Add post"

    add_post_page.add_post(post)
  end

  def should_have_post(post)
    page.should have_content(post.title)
    page.should have_content(post.author)
    page.should have_content(post.content)
  end
end

