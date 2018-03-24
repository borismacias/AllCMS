class User < ApplicationRecord

  has_many :blog_posts

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
end
