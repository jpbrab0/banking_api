defmodule BankingApi.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :age, :integer
      add :cpf, :string
      add :pix, :string
      add :nickname, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:cpf])
    create unique_index(:users, [:pix])
    create unique_index(:users, [:nickname])
    create unique_index(:users, [:password])
  end
end
