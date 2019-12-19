class Shift < ApplicationRecord
    belongs_to :time_card
    has_one :working_hour, dependent: :destroy
end
