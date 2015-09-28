class Spree::Lookbook < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :items, class_name: 'Spree::LookbookItem', foreign_key: 'lookbook_id', dependent: :destroy

  attr_reader :featured_image_remote_url

  validates :name, :publish_date, presence: true

  has_attached_file :featured_image,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/lookbook/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/lookbook/:id/:style/:basename.:extension'

  validates_attachment :featured_image,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false)}
  scope :recent, -> { enabled.order('created_at DESC').limit(5)}

  def featured_image_remote_url=(url_value)
    if url_value.present?
      self.featured_image = URI.parse(url_value)
      @featured_image_remote_url = url_value
    end
  end

end
