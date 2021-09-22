defmodule Hospital.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctor) do
      add :email_address, :string
      add :password, :string
      add :name, :string
      add :phone_no, :string
      add :birth_date, :date
      add :entry_date, :date
      add :experience, :string
    end
  end
end
