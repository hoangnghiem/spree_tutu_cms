class Spree::LatestController < Spree::StoreController

  def show
    @intro_block = Spree::Cms::Block.render 'Latest Intro'
    @latest_products = Spree::Product.where(latest: true)
  end
end