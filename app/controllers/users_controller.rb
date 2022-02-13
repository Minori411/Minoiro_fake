class UsersController < ApplicationController
    def new
    end

    def index
        @users= User.all
        @users= User.search(params[:search])
    end
end
