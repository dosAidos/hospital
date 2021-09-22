defmodule Hospital.Repo.Migrations.CreateHospitals do
  use Ecto.Migration

  def change do
    create table(:hospital) do
      add :name, :string
      add :address, :string
      add :postal_code, :string
      add :public, :boolean
      add :number_of_buildings, :integer
    end
  end
end
