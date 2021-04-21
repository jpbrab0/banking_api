defmodule BankingApi.User.Methods do 
  alias Ecto.Multi
  alias BankingApi.{Repo, Account, User}

  @moduledoc """
    This module is for run databases functions, for exemple, create users, view balance of your account and anouther functions.
  """

  def get_balance(account_uuid) do 
    case Repo.get!(Account, account_uuid) do 
      result ->
        result

      nil ->
        {:error, "Non found results of this Account UUID"}
    end
  end

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

  defp account_changeset(user_id), do: Account.changeset(%{user_id: user_id, balance: "100.00"})
  
  defp run_transaction(multi) do 
    case Repo.transaction(multi) do 
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{create_account: account}} -> {:ok, account}
    end
  end
end
