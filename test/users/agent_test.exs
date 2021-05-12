defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when the user is found, returns the user" do
      :user
      |> build(cpf: "12345678900")
      |> UserAgent.save()

      response = UserAgent.get("12345678900")

      expected_response =
        {:ok,
         %User{
           address: "Avenida Paulista, 500",
           age: 25,
           cpf: "12345678900",
           email: "ayrtonsouza@icloud.com",
           name: "Ayrton Souza"
         }}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = UserAgent.get("not-a-real-cpf")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
