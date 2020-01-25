class User < ApplicationRecord
  validates :name1,presence: true
  validates :name2,presence: true
  has_many :salaries, dependent: :destroy

end
