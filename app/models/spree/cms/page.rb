class Spree::Cms::Page < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true, uniqueness: true, format: { with: /\A[\w\-\/]*\z/, message: "invalid url format" }

  scope :enabled, -> { where(:enabled => true) }
  scope :disabled, -> { where(:enabled => false)}
end
