require 'liquid'
class Spree::Cms::Block < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :template, presence: true
  has_many :contents, class_name: 'Spree::Cms::BlockContent', dependent: :destroy

  after_save :generate_block_content

  def render
    args = {}
    contents.each do |block_content|
      args["#{block_content.code}__#{block_content.asset.asset_type}"] = case block_content.asset.asset_type
          when 'image'
            block_content.asset.content.photo.url
          when 'text'
            block_content.asset.content.content.html_safe
          when 'richtext'
            block_content.asset.content.content.html_safe
          end
    end
    puts args
    ::Liquid::Template.parse(template).render(args)
  end

  def self.render(name)
    find_by_name!(name).render
  end

  private

  def generate_block_content
    puts 'generate_block_content'
    begin
      # extract variable {{ }}
      content_variables = template.scan(/\{\{(.*?)\}\}/).flatten.map(&:strip).uniq
      content_codes = content_variables.map {|var| var.split('__').first }

      contents.each do |content|
        # clean up old contents
        unless content_codes.include?(content.code)
          puts "destroy content"
          content.destroy
        else
          content_codes.delete(content.code)
          content_variables.delete(content.code + "__" + content.asset.asset_type)
        end
      end
      puts "new content_codes = #{content_codes}"
      puts "new content_variables = #{content_variables}"
      if content_codes.any?
        content_variables.each do |var|
          code, asset_type = var.split('__')
          if Spree::Cms::BlockContent::ASSET_TYPES.include?(asset_type)
            contents.create!(code: code, asset: Spree::Cms::Asset.new(asset_type: asset_type))
          end
        end
      end
    rescue Exception => e
      puts e.message
      raise 'ERRRRRRRORRRR'
    end
  end
end
