class TaskController < ApplicationController
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

    
end
