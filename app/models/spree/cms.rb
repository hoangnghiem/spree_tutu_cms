module Spree::Cms
  def self.table_name_prefix
    'spree_cms_'
  end

  # exclude cms name from model under cms namespace
  # refer to https://github.com/rails/rails/issues/10705
  def self.use_relative_model_naming?
    true
  end
end
