class Spree::Admin::Cms::DesignsController < Spree::Admin::BaseController

  before_action :find_layout

  helper_method :collection_url

  def show

  end

  def update
    @layout.update_attributes layout_params

    redirect_to admin_cms_layouts_path
  end

  private

  def collection_url
    admin_cms_layouts_url
  end

  def find_layout
    @layout = Spree::Cms::Layout.find_by id: params[:layout_id]
  end

  def layout_params
    params.require(:layout).permit(
      :template
    )
  end

end