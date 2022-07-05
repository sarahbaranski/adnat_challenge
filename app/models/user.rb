class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true

  belongs_to :organisation, optional: true
  has_many :shifts
end
