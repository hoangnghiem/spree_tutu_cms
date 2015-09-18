class Spree::Admin::Cms::PageContentsController < Spree::Admin::BaseController

  before_action :find_page
  before_action :find_page_content, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_page_contents
    @page.layout.sections.each do |section|
      @page.page_contents.find_or_initialize_by(section: section)
    end
  end

  def new
    @page_content = @page.page_contents.new
    @page_content.section = Spree::Cms::Section.find(params[:section_id]) if params[:section_id]
  end

  def create
    @page_content = @page.page_contents.new page_content_params

    if @page_content.save
      redirect_to admin_cms_page_page_contents_path(@page), notice: 'Page content created successfully.'
    else
      render :new
    end
  end

  def update
    @page_content.update_attributes page_content_params

    redirect_to admin_cms_page_page_contents_path, notice: 'Page content updated successfully.'
  end

  def destroy
    @page_content.destroy

    respond_with(@page_content) do |format|
      format.html { redirect_to admin_cms_page_page_contents_path(@page), notice: 'Page content destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_cms_page_page_contents_url(@page)
  end

  def load_page_contents
    @page_contents = @page.page_contents
  end

  def find_page
    @page = Spree::Cms::Page.find params[:page_id]
  end

  def find_page_content
    @page_content = Spree::Cms::PageContent.find params[:id]
  end

  def page_content_params
    params.require(:page_content).permit(
      :content,
      :section_id
    )
  end

end