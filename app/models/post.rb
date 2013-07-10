class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true

  has_many :comments

  def self.published
    all.order('created_at DESC').includes(:comments)
  end
end
