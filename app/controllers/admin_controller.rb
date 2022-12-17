class AdminController < ApplicationController
  def index
    @projects = Project.where(admin_id: current_user)
  end
end
