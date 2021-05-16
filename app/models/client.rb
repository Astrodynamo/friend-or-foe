class Client < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports

    #client view helpers: average_rating, positivity_ratio, payment_record, times_blacklisted, times_reported
    def average_rating
        ratings = reports.collect{ |report| report.rating }
        average = ratings.sum / ratings.size
    end
end
