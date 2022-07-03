class User < ApplicationRecord
  has_secure_password
  validates :email_address, presence: true, uniqueness: true

  belongs_to :Organisation, optional: true
  has_many :shifts
end