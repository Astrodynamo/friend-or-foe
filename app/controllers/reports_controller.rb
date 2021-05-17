class ReportsController < ApplicationController
    before_action :require_login


    def new
        @report = Report.new(user_id: current_user.id)
        @clients = Client.all
    end

    def create
        if report_params[:client_id]
            @report = Report.create(report_params)
            redirect_to user_report_path(current_user, @report)
        #elsif report_params[:client_attributes][:name]
        #    @report = Report.new.build_client(name: report_params[:client_attributes][:name]).update(report_params)
        else
            render "/reports/new"
        end
    end                                                                                                                                                                                                                             
    
    def show
        @report = Report.find(params[:id])
    end

    def edit
    end

    def patch
    end

    def delete
    end

    private

    def report_params
        params.require(:report).permit(:user_id, :client_id, :date, :positive, :payment, :appointment, :rating, :blacklist, client_attributes: :name).delete_if do |key, val|
            val == "n/a"
        end
    end
end
