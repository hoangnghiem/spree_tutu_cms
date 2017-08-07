class Spree::Cms::Section < ActiveRecord::Base

  validates :name, :key, presence: true, uniqueness: { scope: :layout_id }
  belongs_to :layout, class_name: 'Spree::Cms::Layout', foreign_key: 'layout_id', touch: true

  before_validation :variablize_key

  private

  def variablize_key
    self.key = key.try(:downcase).try(:parameterize).try(:underscore)
  end
end
