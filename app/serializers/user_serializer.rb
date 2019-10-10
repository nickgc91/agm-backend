class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :accountability_partner, :goals
        def goals 
            self.object.goals.map do |goal|
             {goal: goal.title}
        end
    end 
end