class JobApplicationsController < ApplicationController

    def index
        @applications = JobApplication.where(user_id: current_user.id)
    end

    def show
        @application = JobApplication.find_by(id: params[:id])
    end

    def new
        @application = current_user.job_applications.build
        @application.build_company
    end

    def create
        @application = JobApplication.new(job_application_params)
        @application.user_id = current_user.id

        if @application.save
            redirect_to job_applications_path
        else
            flash.now[:error] = @application.errors.full_messages
            render :new
        end
    end

    private

    def job_application_params
        params.require(:job_application).permit(
            :user_id,
            :company_id,
            :status,
            company_attributes: [
                :name
            ]
        )
    end
end