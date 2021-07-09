class User < ApplicationRecord
  include Sluggable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 5 }

  # Votes
  has_many :votes

  sluggable_column :username

  def admin?
    self.role == 'admin'
  end
end
