defmodule Bptracker.Repo do
  use Ecto.Repo,
    otp_app: :bptracker,
    adapter: Ecto.Adapters.Postgres
end
