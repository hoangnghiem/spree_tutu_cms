class Spree::Admin::Cms::BlocksController < Spree::Admin::BaseController

  before_action :find_block, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_blocks
  end

  def new
    @block = Spree::Cms::Block.new
  end

  def create
    @block = Spree::Cms::Block.new block_params

    if @block.save
      redirect_to edit_admin_cms_block_path(@block), notice: 'Block created successfully.'
    else
      render :new
    end
  end

  def update
    if @block.update_attributes block_params
      redirect_to admin_cms_blocks_path, notice: 'Block updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @block.destroy

    respond_with(@block) do |format|
      format.html { redirect_to admin_cms_blocks_path, notice: 'Block destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_cms_blocks_url
  end

  def load_blocks
    per_page = params[:per_page] || 20
    @blocks = Spree::Cms::Block.page(params[:page]).per(per_page)
  end

  def find_block
    @block = Spree::Cms::Block.find_by id: params[:id]
  end

  def block_params
    params.require(:block).permit(
      :name, :template, :note
    )
  end

end
