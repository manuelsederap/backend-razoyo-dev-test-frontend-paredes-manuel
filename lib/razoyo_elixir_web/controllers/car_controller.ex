defmodule RazoyoElixirWeb.CarController do
  use RazoyoElixirWeb, :controller

  alias RazoyoElixir.ApiEndpointsCars

  def cars_list(conn, params) do
    filter = params["make"]
    render(conn, "cars.json", cars: ApiEndpointsCars.get_cars(filter))
  end

  def car(conn, params) do
    case params["id"] do
      nil ->
        render(conn, "cars.json", cars: ApiEndpointsCars.get_cars(params["filter"]))
      _ ->
        render(conn, "car.json", car: ApiEndpointsCars.get_car(params["id"]))
    end
  end
end
