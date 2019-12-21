module AdminHelper
    def dworktime(start,rest,ending,prepare)
        "#{(ending - start - (rest + prepare) * 60).floor/3600}".rjust(2,"0") + ":" + "#{(ending - start - (rest + prepare) * 60 ).floor%3600/60}".rjust(2,"0")
    end

    def worktime(start,rest,ending,prepare)
        (ending - start - (rest + prepare) * 60)/60
    end    
end
