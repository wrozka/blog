class CommentsController < ApplicationController
  def create
    comment = params[:comment]
    Comment.create!(post_id: params[:post_id],
                    author: comment[:author],
                    text: comment[:text])
    redirect_to root_path
  end
end
