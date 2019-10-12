class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :accountability_partner, :last_meeting, :goals, :journalings, :life_status_tracker
        
    def goals 
        self.object.goals.map do |goal|
            {goal: goal.title}
        end
    end

    def journalings 
        self.object.journalings.map do |journal|
            {journal_title: journal.title,
            journal_text: journal.text}
         end
    end
     
end