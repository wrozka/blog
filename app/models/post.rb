class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true

  def self.published
    all.order('created_at DESC')
  end
end
