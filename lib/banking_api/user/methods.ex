defmodule BankingApi.User.Methods do
  alias Ecto.Multi
  alias BankingApi.{Repo, Account, User}

  @moduledoc """
    This module is for run databases functions, for exemple, create users, view balance of your account and anouther functions.
  """

  @doc """
    Function to get an user account.
  """
  def get_user_account(user_uuid) do
    try do
      result = Repo.get_by!(Account, user_id: user_uuid)

      {:ok, result}
    rescue
      Ecto.NoResultsError ->
        {:error, "Non found results of this Account UUID"}
    end
  end

  @doc """
    Function to create new user in database
  """
  def insert_user(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> Multi.run(:create_account, fn repo, %{create_user: user} -> insert_account(repo, user)  end)
    |> run_transaction()
  end

  defp insert_account(repo, user) do
    user.id
    |> account_changeset()
    |> repo.insert()
  end

  defp account_changeset(user_id), do: Account.changeset(%{user_id: user_id, balance: "1000.00"})

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, _reason, _changes} -> {:error, "Ocurred an error in the database"}
      {:ok, %{create_account: account}} -> {:ok, "The user has been created", account.user_id}
    end
  end
end
