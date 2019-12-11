module AdminHelper
    def worktime(start,rest,ending)
        @display = "#{(ending - start - rest * 60 ).floor/3600}".rjust(2,"0") + ":" + "#{(ending - start - rest * 60 ).floor%3600/60}".rjust(2,"0")
        (ending - start - rest * 60)/60
    end
end
