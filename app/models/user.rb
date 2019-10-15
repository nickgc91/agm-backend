class User < ApplicationRecord
    has_secure_password    

    has_many :goals
    has_many :action_items, through: :goals
    has_many :journalings
    has_one :life_status_tracker

    def last_talked
        self.last_meeting.to_s.slice(0..9)
    end
end
