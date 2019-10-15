class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :accountability_partner, :date]


    def updateAccountabilityDate
        user = get_current_user
        if user
            user.update(last_meeting: user_params[:date])
            render json: { user_last_meeting: user.last_meeting }
        else
            render json: {error: 'Error saving date'}, status: 401
        end
    end

    def index
        users = User.all
        render json: users
    end

    def getUserData
        user = get_current_user
        if user
            render json: user
        else
            render json: {error: 'Invalid token.'}, status: 401
        end
    end


    def signin
        user = User.find_by(username: params[:username])

        if user and user.authenticate(params[:password])
            render json: { username: user.username, token: issue_token({ id: user.id }) }, status: :accepted
        else
            render json: { error: 'Username/password combniation invalid!' }, status: 401 
        end
    end

    def newAccount
        user = User.new(username: user_params[:username], email: user_params[:email], password: user_params[:password],
        accountability_partner: User.first.id)
        
        if user.save
            life_status = LifeStatusTracker.create(
            finances: 0,
            dating: 0,
            social: 0,
            spiritual: 0,
            health: 0,
            user_id: user.id
            )
            render json: { username: user.username, token: issue_token({ id: user.id }) }, status: :created
        else
            render json: { user_errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def validate
        user = get_current_user
        if user
            render json: { username: user.username, token: issue_token({ id: user.id }) }
        else
            render json: {error: 'Invalid token.'}, status: 401
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password, :accountability_partner, :date)
    end


end
