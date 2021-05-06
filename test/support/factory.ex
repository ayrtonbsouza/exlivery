defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
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

  def order_factory do
    %Order{
      delivery_address: "Avenida Paulista, 500",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unit_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("76.50"),
      user_cpf: "12345678900"
    }
  end
end
