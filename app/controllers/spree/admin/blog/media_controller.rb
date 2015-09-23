class Spree::Admin::Blog::MediaController < Spree::Admin::BaseController

  before_action :find_post
  before_action :find_medium, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_media
  end

  def new
    @medium = @post.media.new
  end

  def create
    @medium = @post.media.new medium_params

    if @medium.save
      redirect_to admin_blog_post_media_path(@post), notice: 'Media created successfully.'
    else
      render :new
    end
  end

  def update
    @medium.update_attributes medium_params

    redirect_to admin_blog_post_media_path, notice: 'Media updated successfully.'
  end

  def destroy
    @medium.destroy

    respond_with(@medium) do |format|
      format.html { redirect_to admin_blog_post_media_path, notice: 'Media destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        Spree::Blog::Medium.find(id).set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { render text: 'Ok' }
    end
  end

  private

  def collection_url
    admin_blog_posts_url
  end

  def load_media
    per_page = params[:per_page] || 20
    @media = @post.media.page(params[:page]).per(per_page)
  end

  def find_post
    @post = Spree::Blog::Post.friendly.find params[:post_id]
  end

  def find_medium
    @medium = Spree::Blog::Medium.find params[:id]
  end

  def medium_params
    params.require(:medium).permit(
        :name,
        :url,
        :file,
        :file_remote_url
    )
  end

end