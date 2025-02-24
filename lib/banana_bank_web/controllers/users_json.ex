defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User #{user.name} created!",
      data: data(user)
    }
  end

  defp data(%User{} = user) do
    %{
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
