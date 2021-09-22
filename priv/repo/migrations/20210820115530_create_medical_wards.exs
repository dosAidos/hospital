defmodule Hospital.Repo.Migrations.CreateMedicalWards do
  use Ecto.Migration

  def change do
    create table(:medical_ward) do
      add :title, :string
      add :building_no, :integer
    end
  end
end
