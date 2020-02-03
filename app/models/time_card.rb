class TimeCard < ApplicationRecord
    validates :user_id, :year, :month, :starting_date, :closing_date,
    :salary_id , presence: true
    has_many :shifts, dependent: :destroy
    belongs_to :salary
end
