defmodule Bptracker.Repo.Migrations.AddBp do
  use Ecto.Migration

  def change do
    create table(:observation) do
      add :diastolic, :integer
      add :systolic, :integer
      add :pulse, :integer
      add :weight, :integer
      add :date, :date
      add :time, :time
      add :label, :string
      timestamps()
    end
  end
end
