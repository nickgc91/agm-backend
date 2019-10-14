class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :accountability_partner, :last_meeting, :goals, :journalings, :life_status_tracker
        
    def goals 
        numOfGoals = self.object.goals.all.length
        self.object.goals.map do |goal|
            { 
                numOfGoals: numOfGoals,
                goal: [goal.id, goal.title, completion_status: goal.complete_status], 
                action: goal.action_items.sort_by{|action| action.id }.map do |actionItem|
                    {action: actionItem.action, id: actionItem.id, isComplete: actionItem.isCompleted }
             end }
        end
    end

    def accountability_partner
        accPartner = User.find_by(id: self.object.accountability_partner)
        accPartner.username
    end

    def journalings 
        self.object.journalings.map do |journal|
            {journal_title: journal.title,
            journal_text: journal.text}
         end
    end
     
end

