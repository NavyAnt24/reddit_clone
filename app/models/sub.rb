class Sub < ActiveRecord::Base
  attr_accessible :name, :moderator_id

  validates :name, :moderator_id, presence: true
  validates :name, uniqueness: true

  has_many :links, :through => :link_subs

  belongs_to(
    :moderator,
    :foreign_key => :moderator_id,
    :class_name => 'User'
  )

end