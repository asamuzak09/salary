class Salary < ApplicationRecord
    validates :payment,presence: true
    validates :overtime_pay,presence: true
    validates :holiday_pay,presence: true
    belongs_to :user
    has_many :timecard
end
