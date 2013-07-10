require 'spec_helper'

describe PostsController do
  fake_class(PostAdder)

  describe "#index" do
    it "displays all the posts" do
      posts = [Post.new, Post.new]
      stub(Post).published { posts }

      get :index

      assigns(:posts).should == posts
    end
  end

  describe "#create" do
    context "with valid post" do
      let(:post_details) { { 'title' => 'Hello', 'author' => "Jon", 'content' => "Bla bla bla." } }

      before do
        post :create, post: post_details
      end

      it "adds blog posts" do
        PostAdder.should have_received.add(post_details)
      end

      it "redirects to the home page" do
        response.should redirect_to(root_path)
      end
    end

    context "with invalid post" do
      let(:post_details) { { 'title' => 'Hello' } }
      let(:invalid_post) { Post.new }

      before do
        stub(PostAdder).add(post_details) { raise ActiveRecord::RecordInvalid.new(invalid_post) }

        post :create, post: post_details
      end

      it "assigns the invalid post" do
        assigns(:post).should == invalid_post
      end

      it "renders the new post page" do
        response.should render_template(:new)
      end
    end
  end
end
