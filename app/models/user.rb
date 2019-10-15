class User < ApplicationRecord
    has_secure_password 
    
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, :email, :password, presence: true

    has_many :goals
    has_many :action_items, through: :goals
    has_many :journalings
    has_one :life_status_tracker

    def last_talked
        self.last_meeting.to_s.slice(0..9)
    end

    def provideMastermindUpdates
        sortedGoals = Goal.all.sort_by( &:updated_at).reverse.take(3)
        sortedGoals = sortedGoals.map{ |goal| 
        user = User.find_by(id: goal.user_id)
        { action: 'goal', name: goal.title, user: user.username }}

        sortedJournaling = Journaling.all.sort_by( &:updated_at).take(3)
        sortedJournaling = sortedJournaling.map{ |journal| 
        user = User.find_by(id: journal.user_id)
        { action: 'journal entry', name: journal.title, user: user.username }}

        sortedLifeStatusTracker = LifeStatusTracker.all.sort_by( &:updated_at).reverse.take(3)
        sortedLifeStatusTracker = sortedLifeStatusTracker.map{ |status| 
        user = User.find_by(id: status.user_id)
        { action: 'life status tracker', user: user.username, name: '' }}

        sortedActionItems = ActionItem.all.sort_by( &:updated_at).reverse.take(3)
        sortedActionItems = sortedActionItems.map{ |action| 
        goal = Goal.find_by(id: action.goal_id)
        user = User.find_by(id: goal.user_id)
        { action: 'action item', name: action.action, user: user.username }}


        return sortedGoals, sortedJournaling, sortedLifeStatusTracker, sortedActionItems
    end

end
