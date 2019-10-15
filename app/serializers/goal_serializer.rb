class GoalSerializer < ActiveModel::Serializer

attributes :mastermind_status_update


def mastermind_status_update
    self.object.mastermind_status_update
end
 
end