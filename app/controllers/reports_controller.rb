class ReportsController < ApplicationController
    before_action :require_login

    # GET /users/:id/reports/new -or- /clients/:id/reports/new
    def new
        @report = Report.new(user_id: current_user.id)
        @report.client = Client.find_by(id: params[:client_id]) if params[:client_id] # associate client if coming from client_report path (needs tested)
        @clients = Client.all
    end

    # GET /users/:id/reports -or- /clients/:id/reports
    def index
        redirect_to user_path(current_user)
    end # split this action or define a view with split logic... user reports and client reports are very different things.

    # POST /users/:id/reports -or- /clients/:id/reports
    def create
        if report_params[:client_id] # This seems to work for both new and existing clients, correctly creates and associates new client. Check again after adding validations.
            @report = Report.create(report_params)
            redirect_to user_report_path(current_user, @report)
        #elsif report_params[:client_attributes][:name]
        #    @report = Report.new.build_client(name: report_params[:client_attributes][:name]).update(report_params)
        else
            render "/reports/new"
        end
    end                                                                                                                                                                                                                             
    
    # GET /users/:id/reports/:id -or- /clients/:id/reports/:id
    def show
        @report = Report.find(params[:id])
    end

    # GET /users/:id/reports/:id/edit -or- /clients/:id/reports/:id/edit
    def edit #only edit owned reports
        @report = Report.find_by(id: params[:id])

        @clients = Client.all
    end

    # PATCH /users/:id/reports/:id -or- /clients/:id/reports/:id
    def update #only patch owned reports, do not edit client/user since their ids are in the routing
        @report = Report.find_by(id: params[:id])
        if current_user == @report.user
            #reset bool values that have n/a option
            @report.positive = nil
            @report.appointment = nil
            @report.payment = nil
            @report.update(report_params)
            @report.client_id = report_params[:client_id] if report_params[:client_id]
            redirect_to user_report_path(current_user, @report), notice: "Report updated"
        else
            redirect_to user_reports_path(current_user), alert: "That's not your report"
        end
    end

    # DELETE /users/:id/reports/:id -or- /clients/:id/reports/:id
    def destroy
        @report = Report.find_by(id: params[:id])
        if current_user == @report.user
            @report.destroy
            redirect_to user_reports_path(current_user), notice: "Report deleted"
        else
            redirect_to user_reports_path(current_user), alert: "That's not your report"
        end
    end

    private

    def report_params
        params.require(:report).permit(:user_id, :client_id, :date, :positive, :payment, :appointment, :rating, :blacklist, client_attributes: :name).delete_if do |key, val|
            val == "n/a" || key["name"] == ""
        end #params deletes invalid(n/a) bool responses
    end
end
