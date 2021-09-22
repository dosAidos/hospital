defmodule Hospital.Repo.Migrations.BedBelongsToRoom do
  use Ecto.Migration

  def change do
    alter table(:bed) do
      add :room_id, references :room
    end
  end
end
