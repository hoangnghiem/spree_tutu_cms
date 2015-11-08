class Spree::Cms::AssetImage < ActiveRecord::Base
  has_one :asset, as: :content, class_name: 'Spree::Cms::Asset'
  has_attached_file :photo,
                    styles: { thumb: '100x100>' },
                    default_style: :original,
                    url: '/spree/cms/asset_image/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/cms/asset_image/:id/:style/:basename.:extension'

  validates_attachment :photo,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
end
