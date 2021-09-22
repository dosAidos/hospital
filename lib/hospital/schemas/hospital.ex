defmodule Hospital.Hospital do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{Repo, MedicalWard}

  schema "hospital" do
    field :name, :string
    field :address, :string
    field :postal_code, :string
    field :public, :boolean
    field :number_of_buildings
    has_many :medical_wards, MedicalWard
  end

  def changeset(hospital, params \\ %{}) do
    hospital
    |> Repo.preload(:medical_wards)
    |> cast(params, [:name, :address, :postal_code, :public, :number_of_buildings])
    |> validate_required([:name])
    |> cast_assoc(:medical_wards)
  end

end
