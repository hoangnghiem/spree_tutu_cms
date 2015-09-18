class Spree::Cms::Layout < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :sections, class_name: 'Spree::Cms::Section', dependent: :destroy
end
