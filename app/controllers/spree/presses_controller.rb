class Spree::PressesController < Spree::StoreController
  def show
    @presses = Spree::Press.enabled.order('position ASC')
  end
end