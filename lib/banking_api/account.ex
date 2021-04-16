defmodule BankingApi.Account do 
  use Ecto.Schema
  
  import Ecto.Changeset

  alias BankingApi.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required [:balance, :user_id]
    
  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end

  def changeset(model \\ %__MODULE__{}, params) do 
    model
    |> cast(params, @required)
    |> validate_required(@required)
    |> check_constraint(:balance,
      name: :balance_must_be_positive_or_zero,
      message: "Account value cannot be negative"
    )
  end
end
