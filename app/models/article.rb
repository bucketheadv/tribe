class Article < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  paginates_per 5

  class << self
    def query(params)
      result = self.all
      result = result.where(category_id: params[:category_id]) if params[:category_id].present?
      result = result.offset(params[:offset].to_i) if params[:offset].present?
      result
    end
  end
end
