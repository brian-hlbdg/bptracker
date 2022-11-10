defmodule BpTracker.AverageBp do
    def calculate(diastolic) do
        if diastolic <= 100 do
            diastolic * 5
        else 
            100 + (diastolic - 100) * 1
        end 
    end
    
    def new_diastolic do
        Enum.random(80..165)
    end

    def new_systolic do
        Enum.random(60..110)
    end

    def new_pulse do
        Enum.random(60..120)
    end
    
    def new_weight do
        Enum.random(190..230)
    end
end