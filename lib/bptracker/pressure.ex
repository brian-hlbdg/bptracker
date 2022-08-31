defmodule BpTracker.Pressure do
    use Ecto.Schema
    alias Ecto.Changeset

    @derive Jason.Encoder
    @primary_key {:diastolic, :string, autogenerate: false}
    
    embedded_schema do 
        field :systolic, :string
        field :pulse, :string
        field :weight, :string
    end

    def changeset(schema, attrs) do
        schema
        |> Changeset.cast(attrs, __schema__(:fields))
        |> Changeset.validate_required([:diastolic])
    end
end
