Spree::Core::Engine.routes.draw do
  namespace :admin do
    namespace :cms do
      resources :pages, :except => [ :show ]
    end
  end
end
