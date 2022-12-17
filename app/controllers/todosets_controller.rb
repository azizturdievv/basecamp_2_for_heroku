class TodosetsController < ApplicationController
  before_action :set_todoset, only: %i[ show edit update destroy ]

  # GET /todosets or /todosets.json
  def index
    @project = Project.find(params[:project_id])
    @todosets = @project.todosets 
  end

  # GET /todosets/1 or /todosets/1.json
  def show
  end

  # GET /todosets/new
  def new
    @todoset = Todoset.new
    @project = Project.find(params[:project_id])
  end

  # GET /todosets/1/edit
  def edit
    @project = Project.find(params[:project_id])
  end

  # POST /todosets or /todosets.json
  def create
    @todoset = Todoset.new(todoset_params)

      @project = @todoset.project_id

      if @todoset.save
        redirect_to project_todosets_path(@project)
    end
  end

  # PATCH/PUT /todosets/1 or /todosets/1.json
  def update
      if @todoset.update(todoset_params)
        @project = @todoset.project_id
         redirect_to project_todosets_path(@project)
    end
  end

  # DELETE /todosets/1 or /todosets/1.json
  def destroy
    @todoset.destroy

      @proj = @todoset.project_id
      redirect_to project_todosets_path(@proj)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoset
      @todoset = Todoset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todoset_params
      params.require(:todoset).permit(:name, :project_id)
    end
end
