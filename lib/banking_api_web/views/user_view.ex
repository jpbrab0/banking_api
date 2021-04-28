defmodule BankingApiWeb.UserView do
  use BankingApiWeb, :view

  def render("balance.json", %{user: user}) do
    %{
      status: 200,
      user: %{
        user_id: user.user_id,
        balance: user.balance
      }
    }
  end

  def render("created_user.json", _) do
    %{
        status: 200,
        message: "The user has been created."
    }
  end
end
