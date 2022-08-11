class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

    private 
    def handle_invalid_error
        render json: {error: "You fucked up!"},status: :unprocessable_entity
    end
    def handle_not_found
        render json: {error: "Not found"}, status: 404
    end
    
end
