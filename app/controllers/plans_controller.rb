class PlansController < ApplicationController
    def index
        @plans = Plan.all
    end

    def show
        @plan = Plan.find(params[:id])
        @user = User.find(@plan.user_id)
    end
end
