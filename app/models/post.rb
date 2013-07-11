class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true

  has_many :ratings

  def self.published
    all.order('created_at DESC')
  end

  def rating
    return '-' if ratings.empty?
    1.0 * ratings.map(&:value).sum / ratings.count
  end
end
