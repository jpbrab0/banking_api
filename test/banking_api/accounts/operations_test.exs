defmodule BankingApi.Account.Operations do
  use BankingApi.DataCase, async: true

  alias BankingApi.Account.Operations
  alias BankingApi.User.Methods

  describe "deposit/2" do
    test "Deposit 100$ in a account and return sucess" do
      {:ok, create_user_message, user_id} = Methods.insert_user(%{name: "penguin", email: "clubpenguin@gmail.com", age: 18, cpf: "123456", nickname: "clubpenguin", password: "coxinha123"})

      {:ok, operation_message} = Operations.deposit(user_id, 100.00)

      assert create_user_message == "The user has been created"
      assert operation_message == {:ok, "The deposit was successful"}
    end
  end
end
