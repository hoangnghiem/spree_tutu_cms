class Spree::Admin::LatestProductsController < Spree::Admin::BaseController

  def show
    @latest_products = Spree::Product.where(latest: true)
  end

  def update
    @product = Spree::Product.find(params[:product_id])
    @existed = @product.latest
    @product.update_column(:latest, true)
  end

  def destroy
    @product = Spree::Product.find(params[:product_id])
    @product.update_column(:latest, false)
  end

end