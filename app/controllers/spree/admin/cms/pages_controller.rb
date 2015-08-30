class Spree::Admin::Cms::PagesController < Spree::Admin::BaseController

  before_action :find_page, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_pages
    # @page  = Spree::Cms::Page.new
  end

  def new
    @page = Spree::Cms::Page.new
  end

  def create
    @page = Spree::Cms::Page.new page_params

    if @page.save
      redirect_to admin_cms_pages_path
    else
      render :new
    end
  end

  def update
    @page.update_attributes page_params

    redirect_to admin_cms_pages_path
  end

  def destroy
    @page.destroy

    redirect_to admin_cms_pages_path
  end

  private

  def collection_url
    admin_cms_pages_url
  end

  def load_pages
    per_page = params[:per_page] || 20
    @pages = Spree::Cms::Page.page(params[:page]).per(per_page)
  end

  def find_page
    @page = Spree::Cms::Page.find_by id: params[:id]
  end

  def page_params
    params.require(:page).permit(
        :title,
        :url,
        :enabled,
        :content,
        :meta_keywords,
        :meta_description
    )
  end

end