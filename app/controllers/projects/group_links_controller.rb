class Projects::GroupLinksController < Projects::ApplicationController
  layout 'project_settings'
  before_filter :authorize_admin_project!

  def index
    @group_links = project.project_group_links.all
  end

  def create
    link = project.project_group_links.new
    link.group_id = params[:link_group_id]
    link.group_access = params[:link_group_access]
    link.save

    redirect_to project_group_links_path(project)
  end

  def destroy
    project.project_group_links.find(params[:id]).destroy

    redirect_to project_group_links_path(project)
  end
end
