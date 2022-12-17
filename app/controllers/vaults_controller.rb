class VaultsController < ApplicationController
  before_action :set_project, only: %i[ show edit index new]
  before_action :set_vault, only: %i[ show edit update destroy ]

  # GET /vaults or /vaults.json
  def index
    @vaults = @project.vaults
  end

  # GET /vaults/1 or /vaults/1.json
  def show
  end

  # GET /vaults/new
  def new
    @vault = Vault.new
  end

  # GET /vaults/1/edit
  def edit
  end

  # POST /vaults or /vaults.json
  def create
    @vault = Vault.new(vault_params)

      if @vault.save
        @project = @vault.project_id
        redirect_to project_vaults_path(@project) 

    end
  end

  # PATCH/PUT /vaults/1 or /vaults/1.json
  def update
      if @vault.update(vault_params)
        @project = @vault.project_id
         redirect_to project_vault_url(@project,@vault) 

    end
  end

  # DELETE /vaults/1 or /vaults/1.json
  def destroy
    @vault.destroy

      @project = @vault.project_id
     redirect_to project_vaults_url(@project) 
     
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_vault
      @vault = Vault.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vault_params
      params.require(:vault).permit(:name, :attachm,:project_id)
    end
end
