defmodule BankingApiWeb.AccountControllerTest do
  use BankingApiWeb.ConnCase

  alias BankingApi.User.Methods

  @user_params %{
    name: "joao",
    email: "joao123@gmail.com",
    age: 18,
    cpf: "123456678",
    nickname: "jp123",
    password: "coxinha123"
  }

  @anouther_user_params %{
    name: "joao",
    email: "joao1234@gmail.com",
    age: 18,
    cpf: "1234566789",
    nickname: "jp1234",
    password: "coxinha1234"
  }

  describe "make_deposit/2" do
    test "Making deposit and check if route return sucess" do
      {:ok, created_user_message, user_id} = Methods.insert_user(@user_params)

      deposit_conn = post(build_conn(), "api/users/user/deposit", %{id: user_id, quantity: 100.00})

      assert created_user_message == "The user has been created"
      assert deposit_conn.resp_body == "{\"message\":\"The deposit was successful\",\"status\":200}"
    end
  end

  describe "withdraw/2" do
    test "Making withdraw and check if route return sucess" do
      {:ok, created_user_message, user_id} = Methods.insert_user(@user_params)

      deposit_conn = post(build_conn(), "api/users/user/withdraw", %{id: user_id, quantity: 100.00})

      assert created_user_message == "The user has been created"
      assert deposit_conn.resp_body == "{\"message\":\"The withdraw was successful\",\"status\":200}"
    end
  end

  describe "transaction/3" do
    test "Making transaction to a account for anouther account and check if route return sucess" do
      {:ok, sender_created_user_message, sender_user_id} = Methods.insert_user(@user_params)
      {:ok, receiver_created_user_message, receiver_user_id} = Methods.insert_user(@anouther_user_params)

      deposit_conn = post(build_conn(), "api/users/user/transaction", %{sender: sender_user_id, receiver: receiver_user_id, quantity: 100.00})

      assert sender_created_user_message == "The user has been created"
      assert receiver_created_user_message == "The user has been created"
      assert deposit_conn.resp_body == "{\"message\":\"The transaction was successful\",\"status\":200}"
    end
  end
end
