class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  

  def devise_parameter_sanitizer
    if resource_class == Manufacturer
      Manufacturer::ParameterSanitizer.new(Manufacturer, :manufacturer, params)
    elsif resource_class == Customer
          Customer::ParameterSanitizer.new(Customer, :customer, params)
    elsif resource_class == Competitor
      Competitor::ParameterSanitizer.new(Competitor, :competitor, params)        
    else
      super # Use the default one
    end
  end

  private
  	def after_sign_in_path_for(resource)
      if resource_class == Manufacturer
        "/manufacturer_profiles"
      elsif resource_class == Customer    
        "/customer_profiles"
      elsif resource_class == Competitor
        "/competitor_profiles"            
      end  
  	end	

end
