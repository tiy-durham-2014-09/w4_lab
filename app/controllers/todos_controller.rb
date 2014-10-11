class TodosController < ApplicationController
  before_action :authenticate
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_todo, only: [:show, :edit, :update, :destroy]


  # GET /todos
  def index
    @todos = current_user.todos.all
  end

  # GET /todos/1
  def show
    @todos = Todo.find_by_id(params[:id])
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to @todo, notice: 'Todo was successfully created.'
    else
      render :new
    end

  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'Todo was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: 'Todo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def ensure_user_owns_todo
      if @todo.list.user != current_user
        redirect_to root_path, notice: "That's not your Todo."
        # !!! insert notice
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:name, :note, :due_date, :done, :list_id, :user_id)
    end
end
