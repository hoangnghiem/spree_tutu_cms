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
      redirect_to edit_admin_cms_page_path(@page), notice: 'Page created successfully.'
    else
      render :new
    end
  end

  def update
    @page.update_attributes page_params

    redirect_to admin_cms_pages_path, notice: 'Page updated successfully.'
  end

  def destroy
    @page.destroy

    respond_with(@page) do |format|
      format.html { redirect_to admin_cms_pages_path, notice: 'Page destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        Spree::Cms::Page.find(id).set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { render text: 'Ok' }
    end
  end

  private

  def collection_url
    admin_cms_pages_url
  end

  def load_pages
    per_page = params[:per_page] || 20
    @pages = Spree::Cms::Page.order('position').page(params[:page]).per(per_page)
  end

  def find_page
    @page = Spree::Cms::Page.find_by id: params[:id]
  end

  def page_params
    params.require(:page).permit(
        :title,
        :url,
        :enabled,
        :footer_link,
        :content,
        :meta_keywords,
        :meta_description,
        :layout_id
    )
  end

end