class Spree::Admin::Cms::ImagesController < Spree::Admin::BaseController

  def create
    @image = Spree::Cms::Image.new image_params

    if @image.save
      render text: URI.join(request.url, @image.upload.url(:thumb))
    else
      render text: ''
    end
  end

  private

  def image_params
    params.require(:image).permit(:upload)
  end

end