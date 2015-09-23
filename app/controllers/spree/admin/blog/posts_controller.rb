class Spree::Admin::Blog::PostsController < Spree::Admin::BaseController

  before_action :find_post, only: [:edit, :update, :destroy]

  helper_method :collection_url

  def index
    load_posts
  end

  def new
    @post = Spree::Blog::Post.new
  end

  def create
    @post = Spree::Blog::Post.new post_params

    if @post.save
      redirect_to edit_admin_blog_post_path(@post), notice: 'Post created successfully.'
    else
      render :new
    end
  end

  def update
    @post.update_attributes post_params

    redirect_to admin_blog_posts_path, notice: 'Post updated successfully.'
  end

  def destroy
    @post.destroy

    respond_with(@post) do |format|
      format.html { redirect_to admin_blog_posts_path, notice: 'Post destroyed successfully.' }
      format.js   { render :partial => "spree/admin/shared/destroy" }
    end
  end

  private

  def collection_url
    admin_blog_posts_url
  end

  def load_posts
    per_page = params[:per_page] || 20
    @posts = Spree::Blog::Post.page(params[:page]).per(per_page)
  end

  def find_post
    @post = Spree::Blog::Post.friendly.find params[:id]
  end

  def post_params
    params.require(:post).permit(
        :title,
        :featured_image,
        :featured_image_remote_url,
        :short_content,
        :content,
        :enabled
    )
  end

end