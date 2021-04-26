defmodule BankingApi.Account.Operations do
  alias BankingApi.{Repo, Account, User}

  @moduledoc """
    This module is for methods of account, make deposits, withdraws, transactions
  """

  def deposit(account_uuid, quantity) do
    {:ok, account} = get_account(account_uuid)
    quantity =
      quantity
      |> to_string()
      |> Decimal.new()
    new_balance = Decimal.add(account.balance, quantity)

    account
    |> Account.changeset(%{balance: new_balance})
    |> Repo.update!()

    {:ok, "The balance of account has been updated"}
  end

  def withdraw(account_uuid, quantity) do
    {:ok, account} = get_account(account_uuid)

    quantity =
      quantity
      |> to_string()
      |> Decimal.new()

    new_balance = Decimal.sub(account.balance, quantity)

    account
    |> Account.changeset(%{balance: new_balance})
    |> Repo.update!()

    {:ok, "The balance of account has been updated"}
  end

  def transaction(sender_uuid, receiver_uuid, quantity) do
    {:ok, sender_account} = get_account(sender_uuid)
    {:ok, receiver_account} = get_account(receiver_uuid)

    quantity =
      quantity
      |> to_string()
      |> Decimal.new()

    sender_new_balance = Decimal.sub(sender_account.balance, quantity)
    receiver_new_balance = Decimal.add(receiver_account.balance, sender_new_balance)

    receiver_account
    |> Account.changeset(%{balance: receiver_new_balance})
    |> Repo.update!()

    {:ok, receiver_name} = get_name_account(receiver_uuid)

    {:ok, "The transaction was successful to #{receiver_name.name}"}
  end

  defp get_account(uuid) do
    try do
      account_result = Repo.get_by(Account, user_id: uuid)

      {:ok, account_result}
    rescue
      Ecto.NoResultsError ->
        {:error, "Non found results of this Account UUID"}
    end
  end

  defp get_name_account(uuid) do
    try do
      user_result = Repo.get(User, uuid)

      {:ok, user_result}
    rescue
      Ecto.NoResultsError ->
        {:error, "Non found results of this User UUID"}
    end
  end
end
