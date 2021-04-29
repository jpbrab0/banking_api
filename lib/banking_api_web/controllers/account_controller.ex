defmodule BankingApiWeb.AccountController do
  use BankingApiWeb, :controller

  alias BankingApi.Account.Operations

  def make_deposit(conn, params) do
    {:ok, message} = Operations.deposit(params["id"], params["quantity"])

    json(conn, %{message: message})
  end

  def make_withdraw(conn, params) do
    {:ok, message} = Operations.withdraw(params["id"], params["quantity"])

    json(conn, %{status: 200, message: message})
  end

  def make_transaction(conn, params) do
    {:ok, message} = Operations.transaction(params["sender"], params["receiver"], params["quantity"])

    json(conn, %{status: 200, message: message})
  end
end
