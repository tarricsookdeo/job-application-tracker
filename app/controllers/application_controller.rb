class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def welcome
        if signed_in?
            redirect_to('/job_applications')
        end
    end
    
end
