class Spree::Admin::LookbooksController < Spree::Admin::BaseController

  before_action :find_lookbook, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_lookbooks
  end

  def new
    @lookbook = Spree::Lookbook.new
  end

  def create
    @lookbook = Spree::Lookbook.new lookbook_params

    if @lookbook.save
      flash[:success] = "Lookbook successfully created."
      redirect_to edit_admin_lookbook_path(@lookbook)
    else
      render :new
    end
  end

  def update
    @lookbook.update_attributes lookbook_params

    flash[:success] = "Lookbook successfully updated."
    redirect_to admin_lookbooks_path
  end

  def destroy
    @lookbook.destroy

    respond_with(@lookbook) do |format|
      format.html { redirect_to admin_lookbooks_path, notice: 'Lookbook destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end

  end

  private

  def collection_url
    admin_lookbooks_url
  end

  def load_lookbooks
    per_page = params[:per_page] || 20
    @lookbooks = Spree::Lookbook.page(params[:page]).per(per_page)
  end

  def find_lookbook
    @lookbook = Spree::Lookbook.friendly.find params[:id]
  end

  def lookbook_params
    params.require(:lookbook).permit(
        :name,
        :publish_date,
        :enabled,
        :featured_image,
        :featured_image_remote_url
    )
  end

end