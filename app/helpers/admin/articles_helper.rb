module Admin::ArticlesHelper
  def categories_for_select
    Rails.cache.fetch("categories_for_select", expires_in: 1.hours) do
      categories = [['请选择', 0]]
      Category.select("id, name").all.each do |cate|
        categories << [cate.name, cate.id]
      end
      categories
    end
  end
end
