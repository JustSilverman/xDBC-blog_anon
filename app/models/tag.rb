class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  before_save { self.name.downcase! }

  validates_uniqueness_of :name
end
