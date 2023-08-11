defmodule RazoyoElixirWeb.CarView do
  use RazoyoElixirWeb, :view

  def render("cars.json", %{cars: cars}), do: cars
  def render("car.json", %{car: car}), do: car
  def render("not_found.json", result) do
    %{ message: result.message }
  end
end
