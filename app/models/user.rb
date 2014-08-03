class User < ActiveRecord::Base
  email_regex= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :name, :presence => true,
            :length => {:maximum =>50,:minimum =>3}
  validates :email, :presence => true,
            :format => {:with => email_regex},
            :uniqueness => {:case_sensitive => false}

end