defmodule UeberauthCodingExample.Repo.Migrations.CreateUeberauthCodingExample.Auth.User do
  use Ecto.Migration

  def change do
    create table(:auth_users) do
      add :name, :string
      add :avatar, :string
      add :provider, :string
      add :raw_info, :map

      timestamps()
    end
    create unique_index(:auth_users, [:name, :provider])
  end
end
