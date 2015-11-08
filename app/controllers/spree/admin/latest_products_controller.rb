class Spree::Admin::LatestProductsController < Spree::Admin::BaseController

  def show
    @latest_products = Spree::Product.where(latest: true)
  end

  def update
    @product = Spree::Product.find(params[:product_id])
    @product.latest = true
    @product.save
    @existed = Spree::Product.where(latest: true).include?(@product)
  end

  def destroy
    @product = Spree::Product.find(params[:product_id])
    @product.latest = false
    @product.save
  end

end