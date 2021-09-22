defmodule Hospital.Appointment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{Doctor, Patient, Room}

  schema "appointment" do
    field(:price, :float)
    field(:insurance_coverage, :boolean)
    field(:symptoms, :string)
    field(:diagnosis, :string)
    field(:notes, :string)
    field(:time, :naive_datetime)
    belongs_to(:doctor, Doctor)
    belongs_to(:patient, Patient)
    belongs_to(:room, Room)
  end

  @required_fields ~w()a
  @optional_fields ~w(price insurance_coverage symptoms diagnosis notes time room_id doctor_id patient_id)a
  def changeset(appointment, params \\ %{}) do
    appointment
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> cast_assoc(:doctor)
    |> cast_assoc(:room)
    |> cast_assoc(:patient)
  end
end
