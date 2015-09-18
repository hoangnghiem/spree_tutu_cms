class Spree::Cms::PageContent < ActiveRecord::Base
  belongs_to :page, class_name: 'Spree::Cms::Page', foreign_key: :page_id
  belongs_to :section, class_name: 'Spree::Cms::Section', foreign_key: :section_id

  validates :page_id, :section_id, :content, presence: true

end
