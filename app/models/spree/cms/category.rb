class Spree::Cms::Category < ActiveRecord::Base
  has_many :pages
end
