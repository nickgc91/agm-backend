class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :accountability_partner, :last_meeting, :goals, :journalings, :life_status_tracker
        
    def last_meeting
        self.object.last_talked
    end

    def goals 
        numOfGoals = self.object.goals.all.length
        if numOfGoals != 0
            self.object.goals.map do |goal|
             { 
                numOfGoals: numOfGoals,
                goal: [goal.id, goal.title, completion_status: goal.complete_status], 
                action: goal.action_items.sort_by{|action| action.id }.map do |actionItem|
                    {action: actionItem.action, id: actionItem.id, isComplete: actionItem.isCompleted }
                end }
             end
        else
             [numOfGoals: 0,
            goal: [0, 'You have not set any goals at the moment', 'You have not set any goals at the moment']]
        end
    end

    def accountability_partner
        accPartner = User.find_by(id: self.object.accountability_partner)
        if accPartner
            {
                accPartner: accPartner.username,
                last_meeting: last_meeting
            }
        else
            ""
        end
    end

    def journalings 
        self.object.journalings.sort{|a,b| b[:id] <=> a[:id]}.map do |journal|
            {   
                journal_id: journal.id,
                journal_title: journal.title,
                journal_text: journal.text,
                created: journal.created_at.to_s.slice(0..9)
            }
         end
    end

    def mastermind_status_update
        self.object.mastermind_status_update
    end
     
end
