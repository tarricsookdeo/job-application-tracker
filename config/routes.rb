Rails.application.routes.draw do
  root to: 'application#welcome'
  resources :job_applications, only: [:new, :create, :index, :update, :destroy, :show]

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

end
