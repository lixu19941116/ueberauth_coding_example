defmodule UeberauthCodingExample.Auth do
  import Ecto.{Query, Changeset}, warn: false

  alias UeberauthCodingExample.Repo
  alias UeberauthCodingExample.Auth.User

  def create_or_update_user(auth) do
    attrs = %{
      name: auth.info.nickname,
      avatar: auth.info.image,
      provider: Atom.to_string(auth.provider),
    }

    if user = get_user_by(Map.delete(attrs, :avatar)) do
      update_user(user, attrs)
    else
      create_user(attrs)
    end
  end

  def get_user_by(attrs), do: Repo.get_by(User, attrs)

  def create_user(attrs \\ %{}) do
    %User{}
    |> user_changeset(attrs)
    |> Repo.insert
  end

  def update_user(%User{} = user, attrs) do
    user
    |> user_changeset(attrs)
    |> Repo.update
  end

  def user_changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :avatar, :provider])
    |> validate_required([:name, :provider])
    |> unique_constraint(:name, name: :auth_users_name_provider_index)
  end
end
