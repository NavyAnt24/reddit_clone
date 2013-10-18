class Link < ActiveRecord::Base
  attr_accessible :title, :url, :body, :user_id

  validates :title, :url, :user_id, :presence => true
  # before_validation :valid_url_format

  has_many :comments
  has_many :subs, through: :link_subs
  belongs_to :user

  def comments_by_parent_id
    hash = Hash.new
    comments = Comment.find_by_link_id(self.id)
    comments_dup = comments.dup
    until comments_dup.empty?
      comments.each do |comment|
        if comment.parent_comment_id.nil?
          hash[comment_id] = []
        else
          hash[comment_id] = []
          hash[comment.parent_comment_id] << comment_id
        end
      end
    end
    hash
  end

  private

  def valid_url_format

  end

end
