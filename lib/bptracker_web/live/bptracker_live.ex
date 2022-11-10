defmodule BptrackerWeb.BptrackerLive do
    use BptrackerWeb, :live_view
    alias BpTracker.AverageBp
    alias BpTracker.Pressure
    alias Ecto.Changeset


    @impl true
    def mount(_params, _session, socket) do
        updated_socket =
            socket
                |> assign(my_bp: Changeset.change(%Pressure{}))
                |> assign(diastolic: AverageBp.new_diastolic())
                |> assign(systolic: AverageBp.new_systolic())
                |> assign(pulse: AverageBp.new_pulse())
                |> assign(weight: AverageBp.new_weight())
                |> assign(average_diastolic: AverageBp.calculate(10))
                |> assign(average_systolic: 95)
                |> assign(average_pulse: 77)
                |> assign(bmi: 32)
    {:ok, updated_socket}
    end

    @impl true
    def handle_event("validate", form, socket) do
        my_bp = Pressure.changeset(socket.assigns.my_bp, form["pressure"])
        updated_socket =
            socket
            |> assign(:my_bp, my_bp)
            |> check_field_length(:diastolic)
            |> check_field_length(:systolic)
            |> check_field_length(:pulse)
            |> check_field_length(:weight)

        {:noreply, updated_socket}
    end

    @field_list [:diastolic, :systolic, :pulse, :weight]

    defp check_field_length(socket, field) do
        field_value =
            socket.assigns.my_bp
            |> Changeset.get_field(field)
            |> to_string()

        field_index = Enum.find_index(@field_list, &(&1 == field))
        next_field = Enum.at(@field_list, field_index + 1)

        if String.length(field_value) >= 3 && next_field do
            push_event(socket, "focus_input", %{id: input_id(:pressure, next_field)})
        else
            socket
        end
    end

    defp check_diastolic_value(socket, field) do
        field_value =
            socket.assigns.my_bp
            |> Changeset.get_field(field)
            |> to_string()
        {:ok, socket}
    end


end
