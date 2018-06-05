class TaskListsController < ApplicationController
  

  # GET /task_lists
  # GET /task_lists.json
  def index
    @board = Board.find(params[:board_id])
    @task_lists = @board.task_lists
    
    #debugger
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
 

  # GET /task_lists/new
  def new
    @board = Board.find(params[:board_id])
    @task_list = @board.task_lists.new
    #debugger
  end

  def show
    @task_list = TaskList.find(params[:id])
  end
  
  # GET /task_lists/1/edit
  def edit
  
    @task_list = TaskList.find(params[:id])
    
#debugger
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
  
    @task_list = current_user.task_lists.build(task_list_params) 
    @task_list.board_id = params[:board_id]
   # debugger
#debugger
    
      if @task_list.save
        redirect_to board_task_lists_url
      else
        render 'new'
    end
  end

  # PATCH/PUT /task_lists/1
  # PATCH/PUT /task_lists/1.json
    def update
      @task_list = TaskList.find(params[:id])
      if @task_list.update(task_list_params)      
        redirect_to @task_list, notice: 'Task was successfully updated.'   
      else
        render 'edit' 
       end
    end 

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list = TaskList.find(params[:id])
    TaskList.find(params[:id]).destroy
    redirect_to board_task_lists_path(@task_list.board_id), notice: 'Task was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @board = Board.find(params[:board_id])
    @task_list = @board.task_lists
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_list_params
      #debugger
      params.require(:task_list).permit(:name)
      
      
        end
end
