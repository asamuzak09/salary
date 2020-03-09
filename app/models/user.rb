class User < ApplicationRecord
  validates :name1,presence: true
  validates :name2,presence: true
  has_many :salaries, dependent: :destroy
  accepts_nested_attributes_for :salaries
  has_many :time_cards, dependent: :destroy

end
