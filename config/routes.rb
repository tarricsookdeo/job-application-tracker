Rails.application.routes.draw do
  root to: 'application#welcome'
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  resources :job_applications, only: [:new, :create, :index, :update, :destroy, :show, :edit]

  resources :companies do
    resources :job_applications, only: [:index]
  end

end
