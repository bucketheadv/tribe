class Category < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true, uniqueness: true

  paginates_per Settings.paginates.per_page
  mount_uploader :image, CategoryImageUploader
end
