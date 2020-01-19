class ApplicationController < ActionController::Base

    def welcome
        if signed_in?
            redirect_to('/job_applications')
        end
    end
    
end
