defmodule Hospital.Repo.Migrations.AppoinmentBelongsToRoom do
  use Ecto.Migration

  def change do
    alter table(:appointment) do
      add :room_id, references :room
    end
  end
end
