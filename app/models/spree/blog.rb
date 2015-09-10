module Spree::Blog
  def self.table_name_prefix
    'spree_blog_'
  end

  def self.use_relative_model_naming?
    true
  end
end
