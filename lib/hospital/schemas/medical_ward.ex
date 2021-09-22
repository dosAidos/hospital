defmodule Hospital.MedicalWard do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{Hospital, Room, Doctor}

  schema "medical_ward" do
    field(:title, :string)
    field(:building_no, :integer)
    belongs_to(:hospital, Hospital)
    has_many(:rooms, Room)
    many_to_many(:doctors, Doctor, join_through: "doctor_mw")
  end

  @required_fields ~w(title building_no hospital_id)a
  @optional_fields ~w()a
  def changeset(mw, params \\ %{}) do
    mw
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> cast_assoc(:hospital)
    |> cast_assoc(:rooms)
    |> cast_assoc(:doctors)
  end
end
