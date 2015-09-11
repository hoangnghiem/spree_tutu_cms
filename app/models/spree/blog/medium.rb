class Spree::Blog::Medium < ActiveRecord::Base

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


end
