class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def index
    @todos = Todo.order(id: :desc).all
  end

  def create
    @todo = Todo.create! todo_params.merge(status: :yet)
    @todo.broadcast_append_later_to('todo_stream_channel')
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.turbo_stream
    end
  end

  def new
    @todo = Todo.new
  end

  def update
    @todo.update! todo_params
    @todo.broadcast_update_to('todo_stream_channel')
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.turbo_stream
    end
  end

  def edit; end

  def destroy
    @todo.broadcast_remove_to('todo_stream_channel')
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.turbo_stream
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name)
  end
end