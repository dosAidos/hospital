defmodule Hospital.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:room) do
      add :bedroom, :boolean
    end
  end
end
