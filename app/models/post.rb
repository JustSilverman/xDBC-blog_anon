class Post < ActiveRecord::Base
  has_many   :post_tags
  has_many   :tags, :through => :post_tags
  belongs_to :user

  validates :body,  :presence => true
  validates :title, :presence => true

  def tags_string
    self.tags.map { |tag| tag.name }.join(", ")
  end

  def handle_tags(input_tags)
    tags = input_tags.split(",").map do |tag|
      Tag.find_or_create_by_name(tag.strip.downcase).id
    end

    self.tag_ids = tags
  end
end
