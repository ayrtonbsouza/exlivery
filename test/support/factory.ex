defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Ayrton Souza",
      email: "ayrtonsouza@icloud.com",
      cpf: "12345678900",
      age: 25,
      address: "Avenida Paulista, 500"
    }
  end
end
