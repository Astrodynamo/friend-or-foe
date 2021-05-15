class User < ApplicationRecord
  has_secure_password
  belongs_to :business
  has_many :reports
  has_many :clients, through: :reports
end
