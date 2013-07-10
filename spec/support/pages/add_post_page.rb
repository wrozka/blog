def add_post_page
  AddPostPage.new
end

class AddPostPage < Page
  def add_post(post)
    fill_in "Author", with: post.author
    fill_in "Title", with: post.title
    fill_in "Content", with: post.content

    click_button "Add post"
  end
end
