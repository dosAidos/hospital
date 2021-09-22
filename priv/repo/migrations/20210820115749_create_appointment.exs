defmodule Hospital.Repo.Migrations.CreateAppointment do
  use Ecto.Migration

  def change do
    create table(:appointment) do
      add :price, :float
      add :insurance_coverage, :boolean
      add :symptoms, :string
      add :diagnosis, :string
      add :notes, :string
      add :time, :naive_datetime
    end
  end
end
