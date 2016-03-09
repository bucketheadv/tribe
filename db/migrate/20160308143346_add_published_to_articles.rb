class AddPublishedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean, default: 0, null: false
  end
end
