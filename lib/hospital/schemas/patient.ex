defmodule Hospital.Patient do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{Appointment, Bed}

  schema "patient" do
    field(:health_no, :integer)
    field(:name, :string)
    field(:phone_no, :string)
    field(:email_address, :string)
    field(:dependent, :boolean)
    field(:insured, :boolean)
    field(:birth_date, :date)
    field(:priority, Ecto.Enum, values: [green: 1, yellow: 2, orange: 3, red: 4])
    has_many(:appointments, Appointment)
    # has_many :doctors, through: [:appointments, :doctor_id]
    has_one(:bed, Bed)
  end

  @required_fields ~w(health_no name priority)a
  @optional_fields ~w(phone_no email_address dependent insured)a
  def changeset(patient, params \\ %{}) do
    patient
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:phone_no, is: 13)
    |> cast_assoc(:appointments)
    |> cast_assoc(:doctors)
    |> cast_assoc(:bed)
  end
end
