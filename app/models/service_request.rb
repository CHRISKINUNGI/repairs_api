class ServiceRequest < ApplicationRecord
    belongs_to :user
        
    # Define attributes
#  enum request_status: { pending: 0, completed: 1 } # Rename the enum to request_status
    
    # Validations
    validates :selected_services, presence: true
    validates :additional_details, presence: true
    
  end
  