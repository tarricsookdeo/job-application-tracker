class JobApplicationsController < ApplicationController
    before_action :authenticate_user!

    def index
        if params['company_id']
            @applications = current_user.job_applications.by_company(params['company_id'])
        else
            @applications = current_user.job_applications
        end
    end

    def show
        @application = current_user.job_applications.find_by(id: params[:id])
    end

    def new
        @application = current_user.job_applications.build
        @application.build_company
    end

    def create
        binding.pry
        @application = current_user.job_applications.build(job_application_params)

        if @application.save
            redirect_to job_applications_path
        else
            flash.now[:error] = @application.errors.full_messages
            render :new
        end
    end

    def edit
        @application = JobApplication.find_by(id: params[:id])
    end

    def update
        @application = JobApplication.find_by(id: params[:id])

        if @application.update(job_application_params)
            redirect_to @application
          else
            flash.now[:error] = @application.errors.full_messages
            render 'edit'
          end
    end

    def destroy
        @application = JobApplication.find_by(id: params[:id])

        if @application.delete
            redirect_to job_applications_path
        end
    end

    private

    def job_application_params
        params.require(:job_application).permit(
            :position,
            :status,
            company_attributes: [
                :name
            ]
        )
    end
end