class JobApplicationsController < ApplicationController

    def index
        @applications = JobApplication.where(user_id: current_user.id)
    end
    
end