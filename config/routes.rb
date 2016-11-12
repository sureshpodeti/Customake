Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :customers, :controllers => {registrations: 'registrations'}
	resources :homepage
	resources :customer_orders do
		resources :delivery_addresses
		resources :customer_payments, only: [:index, :create]
		resources :order_statuses, only: [:index, :create]
	end	
	resources :customer_profiles, only: [:index]
	resources :customer_instructions, only: [:index]
	resources :contacts, only: [:index]
	resources :careers, only: [:index]
	root "homepage#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
