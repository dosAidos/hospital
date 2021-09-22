defmodule Hospital.Repo.Migrations.CreatePrescriptions do
  use Ecto.Migration

  def change do
    create table(:prescription) do
      add :medicin, :string
      add :regimen, :string
    end
  end
end
