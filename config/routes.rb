Rails.application.routes.draw do
  root 'welcome#index'

  resources :job_descriptions, only: [:new]
  resources :cover_letters, only: %i[create show]

  require 'sidekiq/web'

  Sidekiq::Web.use(Rack::Auth::Basic) do |username, password|
    username == Rails.application.credentials[:sidekiqweb][:username] &&
      password == Rails.application.credentials[:sidekiqweb][:password]
  end

  mount(Sidekiq::Web => 'cover_letter_sidekiq')
end
