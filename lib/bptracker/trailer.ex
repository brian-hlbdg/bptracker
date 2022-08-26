defmodule BpTracker.Trailer do
  use Ecto.Schema
  alias Ecto.Changeset

  @derive Jason.Encoder
  @primary_key {:number, :string, autogenerate: false}

  embedded_schema do
    field :color, :string
    field :type, :string
  end

  def changeset(schema, attrs) do
    schema
    |> Changeset.cast(attrs, __schema__(:fields))
    |> Changeset.validate_required([:number])
  end
end
