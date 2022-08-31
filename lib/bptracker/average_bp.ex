defmodule BpTracker.AverageBp do
    def calculate(diastolic) do
        if diastolic <= 100 do
            diastolic * 5
        else 
            100 + (diastolic - 100) * 1
        end 
    end    
end