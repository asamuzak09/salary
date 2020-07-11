module AdminHelper
    
    def displaytime(time)
        "#{time.floor/3600}".rjust(2,"0") + ":" + "#{time.floor%3600/60}".rjust(2,"0")
    end

end
