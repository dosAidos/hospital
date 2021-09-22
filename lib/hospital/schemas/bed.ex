defmodule Hospital.Bed do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{Room, Patient}

  schema "bed" do
    belongs_to(:room, Room)
    belongs_to(:patient, Patient)
  end

  @required_fields ~w(room_id)a
  @optional_fields ~w(patient_id)a
  def changeset(bed, params \\ %{}) do
    bed
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
