class Spree::Cms::BlockContent < ActiveRecord::Base
  belongs_to :block, class_name: 'Spree::Cms::Block', touch: true
  has_one :asset, class_name: 'Spree::Cms::Asset', dependent: :destroy
  accepts_nested_attributes_for :asset

  validates :code, presence: true, uniqueness: {scope: :block_id}

  ASSET_TYPES = %w{ image text richtext }

  ASSET_TYPES.each do |m|
    define_method(:"asset_#{m}?") do
      asset.asset_type == m
    end
  end
end
