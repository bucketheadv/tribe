module WelcomeHelper
  def all_tags
    Rails.cache.fetch("all_tags_for_show", expires_in: 1.hours) do
      ActsAsTaggableOn::Tag.all
    end
  end

  def articles_count_of_tag(ta)
    Rails.cache.fetch("articles_count_of_tag", expires_in: 5.minutes) do 
      article_ids = ActsAsTaggableOn::Tagging.where(tag_id: ta.id, taggable_type: "Article").pluck(:taggable_id)
      Article.published.where(id: article_ids).count
    end
  end

  def tag_color(tag_m)
    idx = tag_m.present? ? (tag_m.taggings_count % 4) : 0
    colors[idx]
  end

  def colors
    ["success", "warning", "danger", "info"]
  end

  def archive_dates
    Rails.cache.fetch("archive_dates", expires_in: 1.hours) do 
      ActiveRecord::Base.connection.exec_query("SELECT date_format(created_at, '%Y-%m') AS created_at, count(*) AS cnt FROM articles WHERE published = #{Settings.articles.published} GROUP BY date_format(created_at, '%Y-%m') ORDER BY created_at DESC;")
    end
  end
end
