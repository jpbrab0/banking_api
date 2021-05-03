defmodule BankingApi.Account.Operations do
  alias BankingApi.{Repo, Account}

  @moduledoc """
    This module is for methods of account, make deposits, withdraws, transactions
  """

  def deposit(account_uuid, quantity) do
    case get_account(account_uuid) do
      {:ok, account} ->
        quantity =
          quantity
          |> to_string()
          |> Decimal.new()

        new_balance = Decimal.add(account.balance, quantity)

        account
        |> Account.changeset(%{balance: new_balance})
        |> Repo.update!()

        {:ok, "The deposit was successful"}

      {:error, _reason} ->
        {:error,
         "Non found result of this account uuid, and is impossible deposit money in a account that not exists."}
    end
  end

  def withdraw(account_uuid, quantity) do
    case get_account(account_uuid) do
      {:ok, account} ->
        quantity =
          quantity
          |> to_string()
          |> Decimal.new()

        new_balance = Decimal.sub(account.balance, quantity)

        account
        |> Account.changeset(%{balance: new_balance})
        |> Repo.update!()

        {:ok, "The withdraw was successful"}

      {:error, error_message} ->
        {:error, error_message}
    end
  end

  def transaction(sender_uuid, receiver_uuid, quantity) do
    try do
      {:ok, sender_account} = get_account(sender_uuid)
      {:ok, receiver_account} = get_account(receiver_uuid)

      quantity =
        quantity
        |> to_string()
        |> Decimal.new()

      sender_new_balance = Decimal.sub(sender_account.balance, quantity)
      receiver_new_balance = Decimal.add(receiver_account.balance, sender_new_balance)

      sender_account
      |> Account.changeset(%{balance: sender_new_balance})
      |> Repo.update!()

      receiver_account
      |> Account.changeset(%{balance: receiver_new_balance})
      |> Repo.update!()

      {:ok, "The transaction was successful"}
    catch
      error -> {:error, error}
    end
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
end
