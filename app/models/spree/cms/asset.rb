class Spree::Cms::Asset < ActiveRecord::Base
  belongs_to :block_content, class_name: 'Spree::Cms::BlockContent'
  belongs_to :content, polymorphic: true
  accepts_nested_attributes_for :content

  def attributes=(attributes = {})
    self.content_type = attributes[:content_type]
    super
  end

  def content_attributes=(attributes)
    self.content = content_type.constantize.new(attributes)
  end
end
