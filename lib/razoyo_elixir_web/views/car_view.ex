defmodule RazoyoElixirWeb.CarView do
  use RazoyoElixirWeb, :view

  def render("cars.json", %{cars: cars}), do: cars
  def render("car.json", %{car: car}), do: car
end
