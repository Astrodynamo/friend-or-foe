class ReportsController < ApplicationController

    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def patch
    end

    def delete
    end

    private

    def report_params
        params.require(:report).permit(:user_id, :client_id, :date, :positive, :payment, :appointment, :rating, :blacklist)
    end
end
