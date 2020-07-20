crumb :root do
  link "FURIMA", root_path
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :parent do |category|
  category = Category.find(params[:id]).root
  link category.name, parent_category_path(category)
  parent :categories
end

crumb :child do |category|
  category = Category.find(params[:id])
  if category.has_children?  # 表示ページが子カテゴリーの一覧ページの場合
    link category.name, child_category_path(category)
    parent :parent
  else                       # 表示ページが孫カテゴリーの一覧ページの場合
    link category.parent.name, child_category_path(category.parent)
    parent :parent
  end
end

crumb :grandchild do |category|
  category = Category.find(params[:id])
  link category.name, grandchild_category_path(category)
  parent :child
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