class Spree::Blog::Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_content, :content, presence: true

  has_attached_file :featured_image,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/blog/post/:id/featured_image/:style/:basename.:extension',
                    path: ':rails_root/public/spree/blog/post/:id/featured_image/:style/:basename.:extension'
  # convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :featured_image,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false) }
  scope :recent, -> { limit(10) }
end
