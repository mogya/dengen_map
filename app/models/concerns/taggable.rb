module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :spots_tags
    has_many :tags, through: :spots_tags
    has_many :wifi_tags, ->{order("importance DESC") }, class_name: 'Tag::Wifi', :through => :spots_tags, :source => :tag
    has_many :other_tags, ->{order("importance DESC") }, class_name: 'Tag::Other', :through => :spots_tags, :source => :tag
    has_many :category_tags, ->{order("importance DESC") }, class_name: 'Tag::Category', :through => :spots_tags, :source => :tag

    [Tag::Category, Tag::Wifi, Tag::Other].each do |tagclass|
      function_name = tagclass.name.sub('Tag::','').downcase
      define_method function_name do
        self.send("#{function_name}_tags").pluck(:name).join(', ')
      end
    end
  end
end
