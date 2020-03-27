class SessionController < ApplicationController

    get '/login' do
        erb :"/session/login"
    end

    post '/login' do
        # figure out if user exists in DB
        user = User.find_by(email:params[:email])
        # check their submitted password against our DB password them
        if user && user.authenticate(params[:password])
            # set session and take them to /todos
            session[:user_id] = user.id
            redirect '/todos'
        else
            # take them back to login
            redirect '/login'
        end

        # redirect accordingly 
    end

    get '/logout' do
        # destroy session
        session.clear
        redirect '/login'
    end

end