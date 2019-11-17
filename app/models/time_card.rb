class TimeCard < ApplicationRecord
    validates :user_id, :year, :month, :starting_date, :closing_date,
    :salary_id , presence: true
end
