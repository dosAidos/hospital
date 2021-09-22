defmodule Hospital.Repo.Migrations.AppointmentBelongsToPatient do
  use Ecto.Migration

  def change do
    alter table(:appointment) do
      add :patient_id, references :patient
    end
  end
end
