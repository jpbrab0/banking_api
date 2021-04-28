defmodule BankingApi.User.MethodsTest do
  use BankingApi.DataCase, async: true

  alias BankingApi.User.Methods

  @doc """
  Tests for user methods, create user, view data of a user.
  """

  describe "get_balance/1" do
    test "Search an invalid uuid and returns a error" do
      response = Methods.get_user_account("57cbe0b9-0940-49a6-a579-3377f97fc3ef")

      assert response == {:error, "Non found results of this Account UUID"}
    end
  end

  describe "insert_user/1" do
    test "Create a user with a account and returns sucess" do
      params = %{name: "penguin", email: "clubpenguin@gmail.com", age: 18, cpf: "123456", nickname: "clubpenguin", password: "coxinha123"}

      assert Methods.insert_user(params) == {:ok, "The user has been created"}
    end

    test "Create a user with account with invalid params and returns a error" do
      params = %{name: "penguin", email: "clubpenguin@gmail.com", age: 17, cpf: "123456", nickname: "clubpenguin", password: "1234"}

      assert Methods.insert_user(params) == {:error, "Ocurred an error in the database"}
    end
  end
end
