class Spree::Admin::LookbookItemsController < Spree::Admin::BaseController

  before_action :find_lookbook
  before_action :find_lookbook_item, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_items
  end

  def new
    @lookbook_item = @lookbook.items.new
  end

  def create
    @lookbook_item = @lookbook.items.new lookbook_item_params

    if @lookbook_item.save
      redirect_to admin_lookbook_lookbook_items_path(@lookbook), notice: 'Item created successfully.'
    else
      render :new
    end
  end

  def update
    @lookbook_item.update_attributes lookbook_item_params

    redirect_to admin_lookbook_lookbook_items_path(@lookbook), notice: 'Item updated successfully.'
  end

  def destroy
    @lookbook_item.destroy

    respond_with(@lookbook_item) do |format|
      format.html { redirect_to admin_lookbook_lookbook_items_path(@lookbook), notice: 'Item destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        Spree::LookbookItem.find(id).set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { render text: 'Ok' }
    end
  end

  private

  def collection_url
    admin_lookbook_lookbook_items_url
  end

  def load_items
    per_page = params[:per_page] || 20
    @items = @lookbook.items.page(params[:page]).per(per_page)
  end

  def find_lookbook
    @lookbook = Spree::Lookbook.friendly.find params[:lookbook_id]
  end

  def find_lookbook_item
    @lookbook_item = Spree::LookbookItem.find params[:id]
  end

  def lookbook_item_params
    params.require(:lookbook_item).permit(
        :image,
        :image_remote_url,
        :group_id
    )
  end

end
