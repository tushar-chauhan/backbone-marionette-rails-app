class TodosController < ApplicationController

  def index
    @todos = current_user.todos
  end

  def create
    @todo = Todo.new(permitted_attrs)
    @todo.user_id = current_user.id
    if @todo.save
      render :create
    else
      render :create, status: 422
    end
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update_attributes(permitted_attrs)
      render :create
    else
      render :create, status: 422
    end
  end

  def destroy
    @todo = Todo.find params[:id]
    @todo.destroy() if @todo.user_id == current_user.id
    render json: {}
  end


  private

  def permitted_attrs
    params.require(:todo).permit(:content)
  end
end
