defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @required_params [:name, :password, :email, :cep]

  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:name, min: 3, max: 100)
    |> validate_length(:cep, is: 8)
    |> validate_length(:password_hash, min: 8, max: 100)
    |> add_password_hash()
  end

  defp add_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp add_password_hash(changeset), do: changeset
end
