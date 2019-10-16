class LifeStatusTrackersController < ApplicationController

    wrap_parameters :life_status_tracker, include: [:finances, :dating, :social, :spiritual, :health]

    def lifeStatusUpdate
        user = get_current_user
        life_status = LifeStatusTracker.find_by(user_id: user.id)
        if life_status
            life_status.update(life_params)
            render json: life_status, status: 200
        else
            render json: { life_status_tracker_errors: life_status.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private

    def life_params
        params.require(:life_status_tracker).permit(:finances, :dating, :social, :spiritual, :health)
    end
end
