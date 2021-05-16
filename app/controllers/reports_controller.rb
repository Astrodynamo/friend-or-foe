class ReportsController < ApplicationController
    before_action :require_login

    def new
        @report = Report.new(user_id: current_user.id)
        @clients = Client.all
    end

    def create
        raise params.inspect
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
        params.require(:report).permit(:user_id, :client_id, :date, :positive, :payment, :appointment, :rating, :blacklist, client_attributes: :name)
    end
end
