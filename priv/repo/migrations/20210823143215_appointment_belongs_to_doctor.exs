defmodule Hospital.Repo.Migrations.AppointmentBelongsToDoctor do
  use Ecto.Migration

  def change do
    alter table(:appointment) do
      add :doctor_id, references :doctor
    end
  end
end
