class TimeCard < ApplicationRecord
    validates :user_id, :year, :month, :starting_date, :closing_date,
    :salary_id , presence: true
    validate :validate_uniqueness
    has_many :shifts, dependent: :destroy
    belongs_to :salary
    belongs_to :user

    def validate_uniqueness
        if self.class.exists?(user_id: user_id, year: year, month: month)
            errors.add(:base, "その条件の出勤時間表は既に存在します。年月日を確認してください。")
        end   
    end
    
end

