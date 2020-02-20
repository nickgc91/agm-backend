class UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :accountability_partner, :date]


    def provideMastermindUpdates
        sortedGoals = Goal.all.sort_by( &:updated_at).reverse.take(3)
        sortedGoals = sortedGoals.map{ |goal| 
        user = User.find_by(id: goal.user_id)
        [goal.title, user.username] }

        sortedJournaling = Journaling.all.sort_by( &:updated_at).reverse.take(3)
        sortedJournaling = sortedJournaling.map{ |journal| 
        user = User.find_by(id: journal.user_id)
        [journal.title, user.username] }

        sortedLifeStatusTracker = LifeStatusTracker.all.sort_by( &:updated_at).reverse.take(3)
        sortedLifeStatusTracker = sortedLifeStatusTracker.map{ |status| 
        user = User.find_by(id: status.user_id)
        [user.username] }

        sortedActionItems = ActionItem.all.select{ |action| action.isCompleted == true }.sort_by( &:updated_at).reverse.take(6)
        sortedActionItems = sortedActionItems.map{ |action| 
        goal = Goal.find_by(id: action.goal_id)
        user = User.find_by(id: goal.user_id)
        [ action.action, user.username]}
        
        
        render json: {
            goalUpdates: sortedGoals,
            journalingUpdates: sortedJournaling,
            lifeStatusUpdates: sortedLifeStatusTracker,
            actionUpdates: sortedActionItems
        }
    end


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
        users = User.all.sort_by{|user| user.id }
        render json: users
    end

    def getUserData
        # user = get_current_user
        user = User.find_by(username: 'Imran')
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
        acc_num = rand(1..User.all.length)
        user = User.new(username: user_params[:username], email: user_params[:email], password: user_params[:password],
        accountability_partner: acc_num)
        
        if user.save
            life_status = LifeStatusTracker.create(
            finances: 5,
            dating: 5,
            social: 5,
            spiritual: 5,
            health: 5,
            user_id: user.id
            )
            render json: { username: user.username, token: issue_token({ id: user.id }) }, status: :created
        else
            render json: { error: user.errors.full_messages }, status: :unprocessable_entity
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
