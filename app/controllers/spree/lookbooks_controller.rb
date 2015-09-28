class Spree::LookbooksController < Spree::StoreController

  def index
    @lookbooks = Spree::Lookbook.recent
  end

  def show
    @lookbook = Spree::Lookbook.includes(:items).friendly.find(params[:id])
  end
end