class Spree::Press < ActiveRecord::Base

  validates :title, presence: true

  has_attached_file :poster,
                    styles: { thumb: '800x800>' },
                    default_style: :thumb,
                    url: '/spree/cms/press/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/cms/press/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :poster,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }
end
