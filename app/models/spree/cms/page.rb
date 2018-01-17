require 'liquid'

class Spree::Cms::Page < ActiveRecord::Base

  acts_as_list

  belongs_to :layout, class_name: 'Spree::Cms::Layout', foreign_key: :layout_id
  belongs_to :category, class_name: 'Spree::Cms::Category', foreign_key: :category_id
  has_many :page_contents, class_name: 'Spree::Cms::PageContent', dependent: :destroy

  validates :title, :layout_id, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: /\A[\w\-\/]*\z/, message: "invalid url format" }

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false)}

  scope :footer_link, -> { where(:footer_link => true) }

  def render
    args = {}
    page_contents.each do |page_content|
      args[page_content.section.key] = page_content.content
    end
    ::Liquid::Template.parse(layout.template).render(args)
  end

end
