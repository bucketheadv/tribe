module WelcomeHelper
  def all_tags
    Rails.cache.fetch("all_tags_for_show", expires_in: 1.hours) do
      ActsAsTaggableOn::Tag.all
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
      ActiveRecord::Base.connection.exec_query("SELECT date_format(created_at, '%Y-%m') AS created_at, count(*) AS cnt FROM articles GROUP BY date_format(created_at, '%Y-%m') ORDER BY created_at DESC;")
    end
  end
end
