class PublicHoliday < ApplicationRecord
    validates :date, uniqueness: true
end
