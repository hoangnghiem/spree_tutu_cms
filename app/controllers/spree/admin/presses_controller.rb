class Spree::Admin::PressesController < Spree::Admin::BaseController

  before_action :find_press, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_presses
    # @press  = Spree::Press.new
  end

  def new
    @press = Spree::Press.new
  end

  def create
    @press = Spree::Press.new press_params

    if @press.save
      redirect_to admin_presses_path
    else
      render :new
    end
  end

  def update
    @press.update_attributes press_params

    redirect_to admin_presses_path
  end

  def destroy
    @press.destroy

    redirect_to admin_presses_path
  end

  private

  def collection_url
    admin_presses_url
  end

  def load_presses
    per_page = params[:per_page] || 20
    @presses = Spree::Press.order('created_at DESC').page(params[:page]).per(per_page)
  end

  def find_press
    @press = Spree::Press.find_by id: params[:id]
  end

  def press_params
    params.require(:press).permit(
        :title,
        :poster,
        :enabled
    )
  end

end