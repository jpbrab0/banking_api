defmodule BankingApi.User do 
  use Ecto.Schema

  import Ecto.Changeset

  alias BankingApi.Account

  @primary_key {:id, :binary_id, autogenerate: true}

  @required [:name, :email, :age, :cpf, :pix, :nickname, :password, :email_verified]

  schema "users" do
    field :name, :string
    field :email, :string
    field :age, :integer
    field :cpf, :string
    field :pix, :string
    field :nickname, :string

    field :password, :string

    has_one :account, Account

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> validate_length(:password, min: 6)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/)
    |> unique_constraint([:email, :nickname, :pix, :password, :cpf])
  end
end
