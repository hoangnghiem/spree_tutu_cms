class Spree::Press < ActiveRecord::Base

  attr_reader :poster_remote_url

  acts_as_list

  validates :title, presence: true

  has_attached_file :poster,
                    styles: { thumb: '1200x800>' },
                    default_style: :thumb,
                    url: '/spree/press/:id/:style/:basename.:extension',
                    path: ':rails_root/public/spree/press/:id/:style/:basename.:extension'
                    # convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  validates_attachment :poster,
                       :presence => true,
                       :content_type => { :content_type => %w(image/jpeg image/jpg image/png image/gif) }

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false)}

  def poster_remote_url=(url_value)
    if url_value.present?
      self.poster = URI.parse(url_value)
      @poster_remote_url = url_value
    end
  end

end
