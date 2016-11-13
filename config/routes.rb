Rails.application.routes.draw do
  devise_for :manufacturers, :controllers => {registrations: 'registrations'}
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :customers, :controllers => {registrations: 'registrations'}
  
	resources :homepage
	resources :customer_orders do
		resources :delivery_addresses
		resources :customer_payments, only: [:index, :create]
		resources :order_statuses, only: [:index, :create]
	end	


	resources :manufacturer_orders do
		resources :manufacturer_payments, only: [:index, :create]
		resources :manufacturer_statuses 
	end	

	
	resources :customer_profiles, only: [:index]
	resources :manufacturer_profiles, only: [:index]
	resources :customer_instructions, only: [:index]
	resources :manufacturer_instructions, only: [:index]
	resources :manufacturer_addresses, only: [:index]
	resources :contacts, only: [:index]
	resources :careers, only: [:index]
	root "homepage#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
