class Spree::PossiblePage
  def self.matches?(request)
    return false if request.path =~ /(^\/+(admin|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+)/
    !Spree::Cms::Page.enabled.find_by_url(request.path[1..-1]).nil?
  end
end

Spree::Core::Engine.routes.draw do
  namespace :admin do
    namespace :cms do
      resources :pages, :except => [ :show ]
    end
  end

  constraints(Spree::PossiblePage) do
    get '*page_path', :to => 'cms/pages#show', :as => :page
  end
end
