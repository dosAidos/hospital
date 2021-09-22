defmodule Hospital.Doctor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hospital.{MedicalWard, Appointment, Validations}

  schema "doctor" do
    field(:email_address, :string)
    field(:password, :string)
    field(:name, :string)
    field(:phone_no, :string)
    field(:birth_date, :date)
    field(:entry_date, :date)
    field(:experience, Ecto.Enum, values: [:intern, :mid, :senior])
    many_to_many(:medical_wards, MedicalWard, join_through: "doctor_mw")
    has_many(:appointments, Appointment)
    # has_many :patients, through: [:appointments, :patient]
  end

  @required_fields ~w(email_address password name phone_no)a
  @optional_fields ~w(birth_date entry_date experience)a
  def changeset(doctor, params \\ %{}) do
    doctor
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_length(:phone_no, min: 13)
    |> unique_constraint(:email_address)
    |> Validations.validate_in_the_past(:birth_date)
    |> cast_assoc(:medical_wards)
    |> cast_assoc(:appointments)

    # |> cast_assoc(:patients)
  end
end
