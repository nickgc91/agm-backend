class GoalsController < ApplicationController
    wrap_parameters :goal, include: [:goalName, :actionItem1, :actionItem2, :actionItem3, :goalId]
    
    def index
        goals = Goal.all
        render json: goals
    end

    def createNewGoal
        # user = get_current_user
        user = User.find_by(username: 'Imran')
        goal = Goal.create(title: goal_params[:goalName], completion_status: '0%', user_id: user.id )
        if goal_params[:actionItem1] != ''
            actionItem1 = ActionItem.create(action: goal_params[:actionItem1], goal_id: goal.id )
        end
        if goal_params[:actionItem2] != ''
            actionItem2 = ActionItem.create(action: goal_params[:actionItem2], goal_id: goal.id)
        end
        if goal_params[:actionItem3] != ''
            actionItem3 = ActionItem.create(action: goal_params[:actionItem3], goal_id: goal.id)
        end

        if goal
            render json: { goal_title: goal.title, goal_completion_status: goal.completion_status }, status: :created
        else
            render json: { user_errors: user.errors.full_messages }, status: :unprocessable_entity
        end 

    end

    def deleteGoal
        goal = Goal.find_by(id: delete_params[:goalId])
        if goal 
            goal.destroy
            render json: {}, status: 200
        else
            render json: { goal_errors: goal.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    def goal_params
        params.require(:goal).permit(:goalName, :actionItem1, :actionItem2, :actionItem3)
    end

    def delete_params
        params.require(:goal).permit(:goalId)
    end



end
