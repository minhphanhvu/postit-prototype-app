class User < ApplicationRecord
  has_many :posts
  has_many :memberships
  has_many :groups, through: :memberships
end
