class Category < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, CategoryImageUploader
end
