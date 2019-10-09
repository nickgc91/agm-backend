class GoalsController < ApplicationController

    def index
        goals = Goal.all
        render json: goals
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

end
