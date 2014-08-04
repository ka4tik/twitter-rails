class User < ActiveRecord::Base

  attr_accessible :email, :name, :password,:admin
  #todo:setting :admin attr_accessible is a security loophole
  has_many :microposts, :dependent => :destroy

  email_regex= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, :presence => true,
            :length => {:maximum =>50,:minimum =>3}
  validates :email, :presence => true,
            :format => {:with => email_regex},
            :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true,
            :length => {:within => 6..40}

  before_save :encrypt_password
  def has_password?(submitted_password)
    password == encrypt(submitted_password)
  end

  def feed
    Micropost.where("user_id =?",id)
  end

  class << self
    def authenticate(email,submitted_password)
      user = find_by_email(email)
      return nil if user.nil?
      return user if user.has_password?(submitted_password)
    end

    def authenticate_with_salt(id,cookie_id)
      user=find_by_id(id)
      (user && user.id=cookie_id) ? user:nil
    end
  end

  private
  def encrypt_password
    self.password=encrypt(password)
  end

  def encrypt(string)
    secure_hash(string)
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end