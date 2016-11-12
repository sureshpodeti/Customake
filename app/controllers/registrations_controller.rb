class RegistrationsController < Devise::RegistrationsController
	 # Modified Devise params for user login
    def sign_up_params
      if resource_class == Customer     
        params.require(:customer).permit(:admin, :customer_name, :organization_name, :mobile_num, :email, :password, :password_confirmation)
      end  
    end

    def after_sign_up_path_for(resource)
      if resource_class == Customer
        "/customer_profiles"
      end  
    end

    def after_inactive_sign_up_path_for(resource)
      if if resource_class == Customer
        "/customer_profiles"
      end            
    end 
  end
end