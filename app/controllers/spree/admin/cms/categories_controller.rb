class Spree::Admin::Cms::CategoriesController < Spree::Admin::BaseController

  before_action :find_category, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_categories
    # @category  = Spree::Cms::Page.new
  end

  def new
    @category = Spree::Cms::Category.new
  end

  def create
    @category = Spree::Cms::Category.new category_params

    if @category.save
      redirect_to edit_admin_cms_category_path(@category), notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def update
    @category.update_attributes category_params

    redirect_to admin_cms_categories_path, notice: 'Category updated successfully.'
  end

  def destroy
    @category.destroy

    respond_with(@category) do |format|
      format.html { redirect_to admin_cms_categories_path, notice: 'Category destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        Spree::Cms::Category.find(id).set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { render text: 'Ok' }
    end
  end

  private

  def collection_url
    admin_cms_categories_url
  end

  def load_categories
    per_page = params[:per_page] || 20
    @categories = Spree::Cms::Category.page(params[:page]).per(per_page)
  end

  def find_category
    @category = Spree::Cms::Category.find_by id: params[:id]
  end

  def category_params
    params.require(:category).permit(
        :name
    )
  end

end
