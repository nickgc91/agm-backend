class Goal < ApplicationRecord
    belongs_to :user
    has_many :action_items, dependent: :destroy

    def complete_status
        action_items = self.action_items.all
        if action_items.length != 0
            total_action_items = action_items.length
            completedItems = action_items.select { |item|  item.isCompleted == true }.length
            number = ((completedItems.to_f / total_action_items.to_f) * 100.0)
            number = number.round(0)
            number.to_s + '%'
        else
            return "You haven't set any action items yet."
        end
    end

end
