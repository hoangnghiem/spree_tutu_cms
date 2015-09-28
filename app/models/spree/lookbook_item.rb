class Spree::LookbookItem < ActiveRecord::Base

  attr_reader :image_remote_url

  belongs_to :lookbook, class_name: 'Spree::Lookbook', foreign_key: 'lookbook_id'
  has_many :sub_items, class_name: "Spree::LookbookItem", foreign_key: "group_id"
  belongs_to :group, class_name: "Spree::LookbookItem"

  acts_as_list scope: :lookbook

  Paperclip.interpolates :lookbook_id do |attachment, style|
    attachment.instance.lookbook.id
  end

  has_attached_file :image,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/lookbook/:lookbook_id/items/:id/image/:style/:basename.:extension',
                    path: ':rails_root/public/spree/lookbook/:lookbook_id/items/:id/image/:style/:basename.:extension'

  validates_attachment :image,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  scope :root, -> { where(:group_id => [nil, '']) }

  def image_remote_url=(url_value)
    if url_value.present?
      self.image = URI.parse(url_value)
      @image_remote_url = url_value
    end
  end

  def image_url
    image.try(:url)
  end

end
