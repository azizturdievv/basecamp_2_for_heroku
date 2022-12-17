class MessageBoardsController < ApplicationController
  before_action :set_project, only: %i[ show edit index new]
  before_action :set_message_board, only: %i[ show edit update destroy ]

  def index
    @message_boards = @project.message_boards
  end

  def show
    @project = @message_board.project_id
    @message = Message.new
    @messages = @message_board.messages.order("messages.created_at DESC")

  end

  def new
    @message_board = MessageBoard.new
  end

  def edit
  end

  def create
    @message_board = MessageBoard.new(message_board_params)

      if @message_board.save
        @project = @message_board.project_id
        redirect_to project_message_board_url(@project,@message_board)
    end
  end

  # PATCH/PUT /message_boards/1 or /message_boards/1.json
  def update
      if @message_board.update(message_board_params)
        @project = @message_board.project_id
        redirect_to project_message_board_url(@project,@message_board)
    end
  end

  # DELETE /message_boards/1 or /message_boards/1.json
  def destroy
    @message_board.destroy

    respond_to do |format|
      @project = @message_board.project_id
      redirect_to project_message_boards_url(@project)
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_message_board
      @message_board = MessageBoard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_board_params
      params.require(:message_board).permit(:name, :project_id)
    end
end
