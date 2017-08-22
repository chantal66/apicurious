Rails.application.routes.draw do

  root 'home#index'

  get 'auth/github', as: :github_login

end
