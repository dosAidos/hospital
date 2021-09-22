defmodule Hospital.Room do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{MedicalWard, Bed, Appointment}

  schema "room" do
    field(:bedroom, :boolean)
    belongs_to(:medical_ward, MedicalWard)
    has_many(:beds, Bed)
    has_many(:appointments, Appointment)
  end

  @required_fields ~w(bedroom medical_ward_id)a
  @optional_fields ~w()a
  def changeset(room, params \\ %{}) do
    room
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> cast_assoc(:medical_ward)
    |> cast_assoc(:beds)
    |> cast_assoc(:appointments)
  end
end
