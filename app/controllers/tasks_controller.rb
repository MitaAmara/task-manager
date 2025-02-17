class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]

    # Get all task
    def index
        tasks = Task.all
        render json: tasks
    end

    # Create a task
    def create
        task = Task.new(task_params)
        if task.save
            render json: task, status: :created
        else
            render json: task.errors, status: :unprocessable_entity
        end
    end

    # Get a specific task
    def show
        render json: @task
    end

    # Update a task
    def update
        if @task.update(task_params)
            render json: @task
        else
            render json: @task.errors, status: :unprocessable_entity
        end
    end

    # Delete a task
    def destroy
        @task.destroy
        head :no_content
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:title, :description, :completed)
    end
end
