class Spree::Blog::Medium < ActiveRecord::Base
  has_many :sub_media, class_name: "Spree::Blog::Medium", foreign_key: "group_id"
  belongs_to :group, class_name: "Spree::Blog::Medium"

  attr_reader :file_remote_url

  belongs_to :post, class_name: 'Spree::Blog::Post', foreign_key: 'post_id'

  acts_as_list scope: :post

  Paperclip.interpolates :post_id do |attachment, style|
    attachment.instance.post.id
  end

  has_attached_file :file,
                    url: '/spree/blog/post/:post_id/file/:basename.:extension',
                    path: ':rails_root/public/spree/blog/post/:post_id/file/:basename.:extension'

  validates_attachment :file,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  scope :root, -> { where(:group_id => [nil, '']) }

  def file_remote_url=(url_value)
    if url_value.present?
      self.file = URI.parse(url_value)
      @file_remote_url = url_value
    end
  end
end
