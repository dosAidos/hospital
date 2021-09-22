defmodule Hospital.Repo.Migrations.RoomBelongsToMedicalWard do
  use Ecto.Migration

  def change do
    alter table(:room) do
      add :medical_ward_id, references :medical_ward
    end
  end
end
