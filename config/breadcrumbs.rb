crumb :root do
  link "Home", root_path
end

crumb :articles do
  link "Articles", articles_path
  parent :root
end

crumb :article do |article|
  link article.title, article
  parent :articles
end

crumb :categories do
  link "Categories", categories_path
  parent :root
end

crumb :tags do 
  link "Tags", tags_path
  parent :root
end

crumb :archive do 
  link "Archive", archive_path
  parent :root
end

crumb :album do
  link "Album", album_path
  parent :root
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
