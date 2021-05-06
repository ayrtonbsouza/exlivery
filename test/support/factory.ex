defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def item_factory do
    %Item{
      description: "Pizza de Peperoni",
      category: :pizza,
      unit_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

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
