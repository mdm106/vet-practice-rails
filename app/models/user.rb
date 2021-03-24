class User < ApplicationRecord

  has_many :owners, dependent: :destroy

  validates :name, presence: true
  EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true

  before_save { self.email = email.downcase }

  has_secure_password

  Roles = [:admin, :vet]

  def is?(requested_role)
    self.role == requested_role.to_s
  end

end
