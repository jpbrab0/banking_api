defmodule BankingApiWeb.UserController do
  use BankingApiWeb, :controller

  alias BankingApi.User.Methods

  @moduledoc """
  Controllers for run users methods and returns a json.
  """

  def view_account_balance(conn, %{"id" => id}) do
    case Methods.get_user_account(id) do
      {:ok, account_data} -> render(conn, "balance.json", user: account_data)
      {:error, _reason} -> json(conn, %{message: "User not found"})
    end

  end

  def create_user(conn, params) do
    new_user = Methods.insert_user(params)

    render(conn, "created_user.json", user: new_user)
  end
end
