Rails.application.routes.draw do
  devise_for :competitors, :controllers => {registrations: 'registrations'}
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
	resources :competition_instructions, only: [:index]
	resources :competition_tasks, only: [:index] do
		resources :competition_submissions
	end
	resources :competitor_coins, only: [:index]
	# resources :competition_winners
	resources :competitor_profiles, only: [:index]
	resources :products, only: [:index]
	resources :about_us, only: [:index]
	resources :best_designs, only: [:index]
	resources :login_profiles
	resources :faqs, only: [:index]
	resources :kgpians, only: [:index]

	root "homepage#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
