defmodule Hospital.Repo.Migrations.MedicalWardBelongsToHospital do
  use Ecto.Migration

  def change do
    alter table(:medical_ward) do
      add :hospital_id, references :hospital
    end
  end
end
