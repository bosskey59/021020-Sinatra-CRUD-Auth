class TodosController < ApplicationController

    get '/todos' do
        if logged_in?
            @user = current_user
            @todos = @user.todos
            erb :"todos/index"
        else 
            redirect '/login'
        end
        
    end

    get '/todos/new' do
        erb :"/todos/new"
    end

    get '/todos/:id' do
        # id = params[:id]
        find_todo
        if @todo
            erb :"todos/show"
        else
            redirect '/todos'
        end
    end

    post '/todos' do
        todos = Todo.where(content:params[:todo][:content])
        if todos.empty
            todo = Todo.new(params[:todo])
            if todo.save
                redirect "/todos/#{todo.id}"
            else
                redirect "/todos/new"
            end
        else
            redirect "/todos/new"
        end
    end

    get '/todos/:id/edit' do
        find_todo
        if @todo
            erb :"todos/edit"
        else
            redirect '/todos'
        end
    end

    patch '/todos/:id' do
       
        params[:todo][:completed] = params[:todo][:completed] ? true : false

        find_todo

        if @todo.update(params[:todo])
            redirect "/todos/#{@todo.id}"
        else
            redirect "/todos/#{@todo.id}/edit"
        end
    end

    delete '/todos/:id' do
        find_todo
        
        if @todo.destroy
            redirect '/todos'
        else
            redirect "/todos/#{@todo.id}"
        end

    end

    private

    def find_todo
        @todo = Todo.find_by_id(params[:id])
    end


end