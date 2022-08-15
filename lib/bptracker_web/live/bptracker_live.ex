defmodule BptrackerWeb.BptrackerLive do
    use BptrackerWeb, :live_view

    def mount(_params, _session, socket) do 
        socket = 
            assign(socket,
                diastolic: 130, 
                systolic: 97, 
                pulse: 72, 
                weight: 219, 
                average_diastolic: 145, 
                average_systolic: 95, 
                average_pulse: 77,
                bmi: 32 )
    {:ok, socket}
    end

end