defmodule Hospital.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  def change do
    create table(:patient) do
      add :health_no, :integer
      add :name, :string
      add :phone_no, :string
      add :email_address, :string
      add :dependent, :boolean
      add :insured, :boolean
      add :birth_date, :date
      add :priority, :integer
    end
  end
end
