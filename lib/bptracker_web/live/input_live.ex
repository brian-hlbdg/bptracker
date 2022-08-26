defmodule BptrackerWeb.InputLive do
    use BptrackerWeb, :live_view
    alias BpTracker.Trailer
    alias Ecto.Changeset

    @impl true
    def mount(_params, _session, socket) do
        updated_socket =
            socket
            |> assign(my_trailer: Changeset.change(%Trailer{}))
            |> assign(current_time: DateTime.utc_now())
            |> assign(current_day: "Thursday")
            |> assign(current_week: 85)
        {:ok, updated_socket}
    end

    @impl true
    def handle_event("validate", form, socket) do
        my_trailer = Trailer.changeset(socket.assigns.my_trailer, form["trailer"])
        updated_socket =
            socket
            |> assign(:my_trailer, my_trailer)
            |> check_field_length(:number)
            |> check_field_length(:color)
            |> check_field_length(:type)

        {:noreply, updated_socket}
    end

    @field_list [:number, :type, :color]

    defp check_field_length(socket, field) do
        field_value =
            socket.assigns.my_trailer
            |> Changeset.get_field(field)
            |> to_string()

        field_index = Enum.find_index(@field_list, &(&1 == field))
        next_field = Enum.at(@field_list, field_index + 1)

       if String.length(field_value) >= 5 && String.contains?(field_value, "9") && next_field do
            push_event(socket, "focus_input", %{id: input_id(:trailer, next_field)})
       else
            socket
       end
    end
end
