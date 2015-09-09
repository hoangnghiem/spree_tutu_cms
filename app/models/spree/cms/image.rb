class Spree::Cms::Image < ActiveRecord::Base
  has_attached_file :upload,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/cms/image/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/cms/image/:id/:style/:basename.:extension'
                    # convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :upload,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
end
