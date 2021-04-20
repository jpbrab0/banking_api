defmodule BankingApi.User.Methods do 
  alias BankingApi.{Repo, Account, User}

  @moduledoc """
    This module is for run databases functions, for exemple, create users, view balance of your account and anouther functions.
  """

  def get_balance(account_uuid), do: Repo.get!(Account, account_uuid)
end
