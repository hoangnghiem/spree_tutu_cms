class Spree::Cms::AssetRichtext < ActiveRecord::Base
  has_one :asset, as: :content, class_name: 'Spree::Cms::Asset'
  validates :content, presence: true
end
