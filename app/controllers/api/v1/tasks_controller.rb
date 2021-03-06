class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /tasks or /tasks.json
  def index
    respond_to do |format|
      format.json { render json: Task.all }
    end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    respond_to do |format|
      format.json { render json: @task }
    end
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.json { render json: @task, status: :created }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.json { render json: @task, status: :ok }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :time)
    end
end
