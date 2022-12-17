class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
    @projects = current_user.projects
  end

  def show
    if @project.user_id == current_user.id || @project.admin_id == current_user.id
      
    else
      redirect_to root_path
    end
    
  end

  def new
    @project = Project.new
    
  end


  def edit
    @users = User.all
  end

  def create
    @project = Project.new(project_params)

      if @project.save
       redirect_to project_url(@project)
      end
  end

  def update
      if @project.update(project_params)
        redirect_to project_url(@project)
    end
  end

  def destroy
    @project.destroy
    if @project.destroy
      redirect_to projects_url
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :user_id, :admin_id)
    end
end
