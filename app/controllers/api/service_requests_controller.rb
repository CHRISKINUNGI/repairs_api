class Api::ServiceRequestsController < ApplicationController
    # GET /api/users/:user_id/service_requests
    def index
       @user = User.find(params[:user_id])
       @service_requests = @user.service_requests
       render json: @service_requests
    end
   
    # GET /api/service_requests
    def index_all
       @service_requests = ServiceRequest.all
       render json: @service_requests
    end
   
    # POST /api/service_requests
    def create
       @service_request = ServiceRequest.new(service_request_params)
       if @service_request.save
        render json: { message: "Service request created successfully" }, status: :ok

       else
         render json: { errors: @service_request.errors.full_messages }, status: :unprocessable_entity
       end
    end
   
    private
   
    def service_request_params
       params.require(:service_request).permit(:additional_details, :user_id, selected_services: [])
    end
   end
   