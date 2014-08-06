class Micropost < ActiveRecord::Base
  attr_accessible :content,:image
  belongs_to :user
  validates :content, :presence => true,:length => {:maximum =>140}
  validates :user_id, :presence => true
  default_scope :order => 'microposts.created_at DESC'
  mount_uploader :image, ImageUploader

  scope :from_users_followed_by, lambda {|user| followed_by(user)}

  private
  def self.followed_by(user)
    followed_ids=%(SELECT followed_id FROM relationships
                   WHERE follower_id =:user_id)
    self.where("user_id IN (#{followed_ids}) OR user_id = :user_id",:user_id=>user)
  end
end
