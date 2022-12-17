class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
    @message_board = MessageBoard.find(params[:message_board_id])
  end

  def edit
    @message_board = MessageBoard.find(params[:message_board_id])
    # @message_board = @message.message_board
    @project = @message_board.project_id
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        @message_board = @message.message_board
        @project = @message_board.project_id
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('new_project_message_boardmessage',
                                partial: "messages/form",
                                locals: {message: Message.new}),
            turbo_stream.prepend('messages',
                                partial: "messages/message",
                                locals: {message: @message}),
            turbo_stream.update('message_counter', Message.count),
            turbo_stream.update('notice', "Message #{@message.id} created")
            ]
        end
        format.html { redirect_to project_message_board_path(@project,@message_board) }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
      if @message.update(message_params)
        @message_board = @message.message_board
        @project = @message_board.project_id

        redirect_to project_message_board_path(@project,@message_board)
      end
  end

  def destroy
    @message.destroy

      @message_board = @message.message_board
      @project = @message_board.project_id
      if @message.destroy
        redirect_to project_message_board_path(@project,@message_board)
      end
      
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:name, :message_board_id)
    end
end
