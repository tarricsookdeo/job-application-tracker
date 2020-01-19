class JobApplicationsController < ApplicationController

    def index
        @applications = JobApplication.where(user_id: current_user.id)
    end

    def show
        @application = JobApplication.find_by(id: params[:id])
    end

end