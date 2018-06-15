class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /boards
  # GET /boards.json
  def index
    @boards = current_user.boards.all
   end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = current_user.boards.build(board_params)
      if @board.save
        redirect_to boards_path , notice: 'Task was successfully created.'
      else
        render 'new'
      end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update    
      if @board.update(board_params)
        redirect_to @board, notice: 'Task was successfully updated.'
      else
        render 'edit' 
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    redirect_to boards_path(@board.id), notice: 'Task was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board =current_user.boards.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
     # debugger
      params.require(:board).permit(:name)
    end
end
