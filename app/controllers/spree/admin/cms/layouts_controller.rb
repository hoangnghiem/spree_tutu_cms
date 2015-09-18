class Spree::Admin::Cms::LayoutsController < Spree::Admin::BaseController

  before_action :find_layout, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_layouts
  end

  def new
    @layout = Spree::Cms::Layout.new
  end

  def create
    @layout = Spree::Cms::Layout.new layout_params

    if @layout.save
      redirect_to edit_admin_cms_layout_path(@layout)
    else
      render :new
    end
  end

  def update
    @layout.update_attributes layout_params

    redirect_to admin_cms_layouts_path
  end

  def destroy
    @layout.destroy

    respond_with(@layout) do |format|
      format.html { redirect_to admin_cms_layouts_path, notice: 'Layout destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_cms_layouts_url
  end

  def load_layouts
    per_page = params[:per_page] || 20
    @layouts = Spree::Cms::Layout.page(params[:page]).per(per_page)
  end

  def find_layout
    @layout = Spree::Cms::Layout.find_by id: params[:id]
  end

  def layout_params
    params.require(:layout).permit(
      :name
    )
  end

end