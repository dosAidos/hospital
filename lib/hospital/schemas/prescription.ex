defmodule Hospital.Prescription do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.Appointment

  schema "prescription" do
    field(:medicin, :string)
    field(:regimen, :string)
    belongs_to(:appointment, Appointment)
  end

  @required_fields ~w(medicin)a
  @optional_fields ~w(regimen appointment_id)a
  def changeset(prescription, params \\ %{}) do
    prescription
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
