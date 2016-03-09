module ApplicationHelper
  def active?(path)
    if params[:controller] == path 
      "active"
    end
  end
end
