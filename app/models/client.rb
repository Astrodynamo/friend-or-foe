class Client < ApplicationRecord
    has_many :reports
    has_many :users, through: :reports

    def average_rating
        ratings = reports.collect{|report| report.rating}
        if ratings.size == 0
            "Not enough reports"
        else
            average = ratings.sum / ratings.size
        end
    end

    def positivity_ratio
        interactions = reports.collect{|report| report.positive}
        if interactions.size == 0
            "Not enough reports"
        else
            positives = 0
            interactions.each {|interaction| positives += 1 if interaction}
            ratio = (positives.to_f / interactions.count.to_f * 100.0).round(2)
        end
    end

    def payment_record
        invoices = reports.collect{|report| report.payment}
        if invoices.size == 0
            "Not enough reports"
        else
            payments = 0
            invoices.each {|invoice| payments += 1 if invoice}
            ratio = (payments.to_f / invoices.count.to_f * 100.0).round(2)
        end
    end

    def appointment_record
        appointments = reports.collect{|report| report.appointment}
        if appointments.size == 0
            "Not enough reports"
        else
            completed = 0
            appointments.each {|appointment| completed += 1 if appointment}
            ratio = (completed.to_f / appointments.count.to_f * 100.0).round(2)
        end
    end

    def blacklisted
        black = 0
        reports.each {|report| black += 1 if report.blacklist}
        black
    end
end
