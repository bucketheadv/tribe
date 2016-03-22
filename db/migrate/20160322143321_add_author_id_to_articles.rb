class AddAuthorIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :author_id, :integer, default: 0, null: false
  end
end
