# frozen_string_literal: true

class TodosController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_back_with_alert
  rescue_from ActiveRecord::RecordInvalid, with: :redirect_back_with_alert

  def index
    @todos = Todo.all
  end

  def create
    todo = Todo.create!(todo_params)

    redirect_to todos_path, notice: "create todo. id: #{todo.id}"
  end

  def update
    todo = Todo.find(params[:id])
    todo.update!(todo_params)

    redirect_to todos_path, notice: "update todo. id: #{todo.id}"
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy

    redirect_to todos_path, notice: "update todo. id: #{todo.id}"
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end

  def redirect_back_with_alert(err)
    redirect_to todos_path, alert: err.message
  end
end
