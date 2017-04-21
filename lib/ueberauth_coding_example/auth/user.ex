defmodule UeberauthCodingExample.Auth.User do
  use Ecto.Schema

  schema "auth_users" do
    field :avatar, :string
    field :name, :string
    field :provider, :string
    field :raw_info, :map

    timestamps()
  end
end
