class User < ApplicationRecord
  validates :name1,presence: true
  validates :name2,presence: true
  has_many :salaries, dependent: :destroy
  accepts_nested_attributes_for :salaries
  has_many :time_cards, dependent: :destroy

  def self.shifttime(shift)
    (shift.end_at - shift.start_at - shift.rest_minutes * 60)
  end

  def self.overtime(shift,workinghour)
    if shift.kind == "working_day"  && workinghour.punch_in.hour > 0 && workinghour.punch_in < Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
        @working_punch_in = Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
    else 
        @working_punch_in = workinghour.punch_in    
    end

    if (workinghour.punch_out - @working_punch_in - workinghour.rest_minutes * 60) >= shifttime(shift)    
        return (workinghour.punch_out - @working_punch_in - workinghour.rest_minutes * 60) - shifttime(shift)
    end
    0
  end


  def self.worktime(shift,workinghour)
    if shift.kind == "working_day"  && workinghour.punch_in.hour > 0 && workinghour.punch_in < Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
        @working_punch_in = Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
    else 
        @working_punch_in = workinghour.punch_in    
    end 

    if User.overtime(shift,workinghour)/60 >= shift.preparation
        workinghour.punch_out - @working_punch_in - (workinghour.rest_minutes + shift.preparation) * 60
    else
        workinghour.punch_out - @working_punch_in - workinghour.rest_minutes * 60    
    end
  end

end
