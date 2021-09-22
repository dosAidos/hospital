defmodule Hospital.Repo.Migrations.BedBelongsToPatient do
  use Ecto.Migration

  def change do
    alter table(:bed) do
      add :patient_id, references :patient
    end
  end
end
