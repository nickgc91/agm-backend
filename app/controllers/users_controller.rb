class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :accountability_partner]

    def index
        users = User.all
        render json: users
    end

    def signin
        user = User.find_by(username: params[:username])

        if user and user.authenticate(params[:password])
            render json: { username: user.username, token: issue_token({ id: user.id }) }
        else
            render json: { error: 'Username/password combniation invalid!' }, status: 401 
        end
    end

    def newAccount
        user = User.new(user_params)
        
        if user.save
            render json: user, status: :created
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
        params.require(:user).permit(:username, :email, :password, :accountability_partner)
    end


end
