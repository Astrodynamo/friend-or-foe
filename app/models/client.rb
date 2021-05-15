class Client < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports
end
