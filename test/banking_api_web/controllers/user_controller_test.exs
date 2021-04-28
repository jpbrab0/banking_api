defmodule BankingApiWeb.UserControllerTest do
  use BankingApiWeb.ConnCase

  describe "view_account_balance/2" do
    test "Test response of GET route" do
      conn = get(build_conn(), "api/users/user/57cbe0b9-0940-49a6-a579-3377f97fc3ef")

      assert conn.resp_body == "{\"message\":\"User not found\"}"
    end
  end

  describe "create_user/2" do
    test "Create a user and check if returns sucess" do
      params =
        %{
          name: "joao",
          email: "joao123@gmail.com",
          age: 18,
          cpf: "123456678",
          nickname: "jp123",
          password: "coxinha123"
        }
      conn = post(build_conn(), "api/users/user", params)

      assert
      assert conn.resp_body == "{\"message\":\"The user has been created.\",\"status\":200}"
    end
  end
end
