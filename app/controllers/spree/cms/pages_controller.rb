class Spree::Cms::PagesController < Spree::StoreController
  def show
    @page = Spree::Cms::Page.enabled.find_by_url(request.path[1..-1])
    raise ActionController::RoutingError.new("No route matches [GET] #{request.path}") if @page.nil?
  end
end