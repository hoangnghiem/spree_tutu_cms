class Spree::PossiblePage
  def self.matches?(request)
    return false if request.path =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|bespoke|latest|user)+)/
    !Spree::Cms::Page.enabled.find_by_url(request.path[1..-1]).nil?
  end
end

Spree::Core::Engine.routes.draw do
  namespace :admin do
    namespace :cms do
      resources :pages, :except => [ :show ] do
        post :update_positions, on: :collection
        resources :page_contents, :except => [:show]
      end
      resources :images, :only => [ :create ]
      resources :layouts, :except => [ :show ] do
        resources :sections, :except => [:show]
        resource :design, :only => [:show, :update]
      end
      resources :blocks, except: [:show] do
        resources :block_contents
      end
      resources :categories, except: [:show]
    end

    namespace :blog do
      resources :posts, :except => [ :show ] do
        resource :side_content, only: [:show, :update]
        resources :media, :except => [ :show ] do
          post :update_positions, on: :collection
        end
      end
    end

    resources :presses, :except => [ :show ] do
      post :update_positions, on: :collection
    end

    resources :lookbooks, :except => [ :show ] do
      resources :lookbook_items, except: [:show] do
        post :update_positions, on: :collection
      end
    end

    resource :latest_products, only: [:show, :update, :destroy]
  end

  constraints(Spree::PossiblePage) do
    get '*page_path', :to => 'cms/pages#show', :as => :page
  end

  resources :lookbooks, as: 'collections', path: 'collections', only: [:index, :show]

  get 'blog/:post_id', to: 'blog/posts#show', as: :blog_post
  get 'blog', to: 'blog/posts#index', as: :blog
  get 'press', to: 'presses#show', as: :press
  get 'bespoke', to: 'latest#show', as: :latest
end
