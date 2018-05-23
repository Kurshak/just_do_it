class TasksController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complit]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks
       #debugger  
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show  
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
      if @task.save 
        redirect_to tasks_path , notice: 'Task was successfully created.'
      else
        render 'new' 
    end
  end

  def complit
   # debugger
    @task.complit!
    redirect_to tasks_path
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'   
    else
      render 'edit' 
     end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
   end

  private
  # @task получает в себя задачу по id переданому ,current_user_id сравнить с user id  params ,да размуть
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = current_user.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :time, :user_id,:complited)
    end
    
end
