class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates :body,  :presence => true
  validates :title, :presence => true

  def tags_string
    self.tags.map { |tag| tag.name }.join(", ")
  end

  def handle_tags(input_tags)
    input_tags.split(",").map(&:strip).each do |tag|
      self.tags << Tag.find_or_create_by_name(tag)
    end
  end
end
