class Spree::Admin::Blog::SideContentsController < Spree::Admin::BaseController

  before_action :find_post
  helper_method :collection_url

  def show
  end

  def update
    @post.update_attributes post_params

    redirect_to admin_blog_post_side_content_url(@post), notice: 'Post updated successfully.'
  end

  private

  def find_post
    @post = Spree::Blog::Post.friendly.find params[:post_id]
  end

  def post_params
    params.require(:post).permit(
        :side_content_title,
        :side_content_link,
        :side_content_image,
        :side_content_image_remote_url
    )
  end

  def collection_url
    admin_blog_posts_url
  end

end