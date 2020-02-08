module AdminHelper
    
    def displaytime(time)
        "#{time.floor/3600}".rjust(2,"0") + ":" + "#{time.floor%3600/60}".rjust(2,"0")
    end

    def shifttime(shift)
        (shift.end_at - shift.start_at - shift.rest_minutes * 60)
    end

    def overtime(shift,workinghour)
    
        if (workinghour.punch_out - workinghour.punch_in - workinghour.rest_minutes * 60) >= shifttime(shift)    
            return (workinghour.punch_out - workinghour.punch_in - workinghour.rest_minutes * 60) - shifttime(shift)
        end
        0
    end


    def worktime(shift,workinghour)
        if overtime(shift,workinghour)/60 >= shift.preparation
            workinghour.punch_out - workinghour.punch_in - (workinghour.rest_minutes + shift.preparation) * 60
        else
            workinghour.punch_out - workinghour.punch_in - workinghour.rest_minutes * 60    
        end
    end 

end
