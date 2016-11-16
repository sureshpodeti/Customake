class RegistrationsController < Devise::RegistrationsController
	 # Modified Devise params for user login
    def sign_up_params
       if resource_class == Manufacturer
        params.require(:manufacturer).permit(:manufacturer_name, :manufacturing_unit_name, :address, :mobile_num, :email, :password, :password_confirmation)
      elsif resource_class == Customer     
        params.require(:customer).permit(:admin, :customer_name, :organization_name, :mobile_num, :email, :password, :password_confirmation)
      elsif resource_class == Competitor
        params.require(:competitor).permit(:username, :college_name, :mobile_num, :email, :password, :password_confirmation)
            
      end  
    end

    def after_sign_up_path_for(resource)
      if resource_class == Manufacturer
        "/manufacturer_profiles"
      elsif resource_class == Customer
        "/customer_profiles"
      elsif resource_class == Competitor
        "/competitor_profiles"
            
      end  
    end

    def after_inactive_sign_up_path_for(resource)
      if resource_class == Manufacturer
        "/manufacturer_profile"
      elsif resource_class == Customer
        "/customer_profiles"
      elsif resource_class == Competitor
        "/competitor_profiles"
            
      end            
    end 
end