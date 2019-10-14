class ActionItemsController < ApplicationController

    wrap_parameters :action_item, include: [:id]

    def updateActionItemIsCompleted
        action = ActionItem.find_by(id: update_params[:id])
        if action
            action.update(isCompleted: true)
            render json: action
        else
            render json: { user_errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def update_params
        params.require(:action_item).permit(:id)
    end

end
