module Admin::ArticlesHelper
  def categories_for_select
    categories = [['请选择', 0]]
    Category.select("id, name").all.each do |cate|
      categories << [cate.name, cate.id]
    end
    categories
  end
end
