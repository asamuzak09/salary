module AdminHelper
    
    def displaytime(time)
        "#{time.floor/3600}".rjust(2,"0") + ":" + "#{time.floor%3600/60}".rjust(2,"0")
    end

    def shifttime(shift)
        (shift.end_at - shift.start_at - shift.rest_minutes * 60)
    end

    def overtime(shift,workinghour)
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


    def worktime(shift,workinghour)
        if shift.kind == "working_day"  && workinghour.punch_in.hour > 0 && workinghour.punch_in < Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
            @working_punch_in = Time.parse(workinghour.punch_in.strftime("%Y-%m-%d") + " 08:50")
        else 
            @working_punch_in = workinghour.punch_in    
        end 

        if overtime(shift,workinghour)/60 >= shift.preparation
            workinghour.punch_out - @working_punch_in - (workinghour.rest_minutes + shift.preparation) * 60
        else
            workinghour.punch_out - @working_punch_in - workinghour.rest_minutes * 60    
        end
    end 

end
