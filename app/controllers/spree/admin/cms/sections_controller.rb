class Spree::Admin::Cms::SectionsController < Spree::Admin::BaseController

  before_action :find_layout
  before_action :find_section, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_sections
  end

  def new
    @section = @layout.sections.new
  end

  def create
    @section = @layout.sections.new section_params

    if @section.save
      redirect_to admin_cms_layout_sections_path(@layout), notice: 'Section created successfully.'
    else
      render :new
    end
  end

  def update
    @section.update_attributes section_params

    redirect_to admin_cms_layout_sections_path, notice: 'Section updated successfully.'
  end

  def destroy
    @section.destroy

    respond_with(@section) do |format|
      format.html { redirect_to admin_cms_layout_sections_path, notice: 'Section destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_cms_layout_sections_url(@layout)
  end

  def load_sections
    per_page = params[:per_page] || 20
    @sections = @layout.sections.page(params[:page]).per(per_page)
  end

  def find_layout
    @layout = Spree::Cms::Layout.find params[:layout_id]
  end

  def find_section
    @section = Spree::Cms::Section.find params[:id]
  end

  def section_params
    params.require(:section).permit(
      :name,
      :key
    )
  end

end