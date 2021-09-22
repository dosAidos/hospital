defmodule Hospital.Repo.Migrations.PrescriptionBelongsToAppointment do
  use Ecto.Migration

  def change do
    alter table(:prescription) do
      add :appointment_id, references :appointment
    end
  end
end
