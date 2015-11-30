class Spree::Admin::Cms::BlockContentsController < Spree::Admin::BaseController

  before_action :find_block
  before_action :find_content, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_contents
  end

  def new
    @content = @block.contents.new
  end

  def create
    @content = @block.contents.new content_params

    if @content.save
      redirect_to admin_cms_block_block_contents_path(@block), notice: 'Content created successfully.'
    else
      render :new
    end
  end

  def edit
    unless @content.asset.content
      case @content.asset.asset_type
      when 'image'
        @content.asset.content = Spree::Cms::AssetImage.new
      when 'text'
        @content.asset.content = Spree::Cms::AssetText.new
      when 'richtext'
        @content.asset.content = Spree::Cms::AssetRichtext.new
      end
    end
  end

  def update
    @content.update_attributes content_params

    redirect_to admin_cms_block_block_contents_path, notice: 'Content updated successfully.'
  end

  def destroy
    @content.destroy

    respond_with(@content) do |format|
      format.html { redirect_to admin_cms_block_block_contents_path, notice: 'Content destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_cms_block_block_contents_url(@block)
  end

  def load_contents
    per_page = params[:per_page] || 20
    @contents = @block.contents.order('code').page(params[:page]).per(per_page)
  end

  def find_block
    @block = Spree::Cms::Block.find params[:block_id]
  end

  def find_content
    @content = Spree::Cms::BlockContent.find params[:id]
  end

  def content_params
    params.require(:block_content).permit!
  end

end