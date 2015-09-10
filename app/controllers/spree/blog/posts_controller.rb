class Spree::Blog::PostsController < Spree::StoreController

  def index
    @posts = Spree::Blog::Post.recent
  end

  def show
    @post = Spree::Blog::Post.enabled.friendly.find(params[:post_id])
    raise ActionController::RoutingError.new("No route matches [GET] #{request.path}") if @post.nil?
  end

end