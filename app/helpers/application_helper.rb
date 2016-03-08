module ApplicationHelper
  def active?(path)
    if request.path == path 
      "active"
    end
  end
end
