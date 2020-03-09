class Shift < ApplicationRecord
    belongs_to :time_card
    has_one :working_hour, dependent: :destroy
    
    def self.kind(start,ending)
        if ending == start
          :holiday
        else
          :working_day  
        end  
    end
end
