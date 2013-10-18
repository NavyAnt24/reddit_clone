class Comment < ActiveRecord::Base
  attr_accessible :parent_comment_id, :link_id

  validates :link_id, :presence => true

  belongs_to :link
end
