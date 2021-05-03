defmodule BankingApi.Account.OperationsTest do
  use BankingApi.DataCase, async: true

  alias BankingApi.Account.Operations
  alias BankingApi.User.Methods

  @user_params %{
    name: "penguin",
    email: "clubpenguin@gmail.com",
    age: 18,
    cpf: "123456",
    nickname: "clubpenguin",
    password: "coxinha123"
  }

  @different_user_params %{
    name: "penguin",
    email: "clubpenguin1@gmail.com",
    age: 18,
    cpf: "1234567",
    nickname: "clubpenguin1",
    password: "coxinha1234"
  }

  describe "deposit/2" do
    test "Deposit 100$ in a account and return sucess" do
      {:ok, created_user_message, user_id} = Methods.insert_user(@user_params)

      {:ok, deposit_message} = Operations.deposit(user_id, 100.00)

      assert created_user_message == "The user has been created"
      assert deposit_message == "The deposit was successful"
    end
  end

  describe "withdraw/2" do
    test "Withdraw 100$ of a account and return sucess" do
      {:ok, created_user_message, user_id} = Methods.insert_user(@user_params)

      {:ok, withdraw_message} = Operations.withdraw(user_id, 100.00)

      assert created_user_message == "The user has been created"
      assert withdraw_message == "The withdraw was successful"
    end
  end

  describe "transaction/3" do
    test "Transaction 100$ of a account to anouther account and return sucess" do
      {:ok, sender_created_user_message, sender_user_id} = Methods.insert_user(@user_params)
      {:ok, receiver_created_user_message, receiver_user_id} = Methods.insert_user(@different_user_params)

      {:ok, transaction_message} = Operations.transaction(sender_user_id, receiver_user_id, 100.00)

      assert sender_created_user_message == "The user has been created"
      assert receiver_created_user_message == "The user has been created"
      assert transaction_message == "The transaction was successful"
    end
  end
end
