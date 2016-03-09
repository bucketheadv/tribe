class Category < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true, uniqueness: true

  paginates_per 10
  mount_uploader :image, CategoryImageUploader
end
