class Spree::Blog::Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :short_content, :content, presence: true

  has_attached_file :featured_image,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/blog/post/:id/featured_image/:style/:basename.:extension',
                    path: ':rails_root/public/spree/blog/post/:id/featured_image/:style/:basename.:extension'

  validates_attachment :featured_image,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  has_attached_file :side_content_image,
                    styles: { thumb: '600x800>' },
                    default_style: :thumb,
                    url: '/spree/blog/post/:id/side_content_image/:style/:basename.:extension',
                    path: ':rails_root/public/spree/blog/post/:id/side_content_image/:style/:basename.:extension'

  validates_attachment :side_content_image,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  has_many :media, -> { order(position: :asc) }, class_name: 'Spree::Blog::Medium', dependent: :destroy

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false) }
  scope :recent, -> { limit(10)}
end
