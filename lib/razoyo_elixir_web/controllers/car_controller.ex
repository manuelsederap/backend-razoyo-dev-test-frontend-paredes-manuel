defmodule RazoyoElixirWeb.CarController do
  use RazoyoElixirWeb, :controller

  alias RazoyoElixir.ApiEndpointsCars

  def cars_list(conn, params) do
    filter = params["make"]
    render_result(conn, "cars.json", ApiEndpointsCars.get_cars(filter))
  end

  def car(conn, params) do
    case params["id"] do
      nil ->
        render_result(conn, "cars.json", ApiEndpointsCars.get_cars(params["filter"]))
      _ ->
        render_result(conn, "car.json", ApiEndpointsCars.get_car(params["id"]))
    end
  end

  def render_result(conn, _json_name, []) do
    conn
    |> put_status(404)
    |> render("not_found.json", %{message: "No Result found."})
  end

  def render_result(conn, json_name, result) do
    case json_name do
      "cars.json" ->
        conn
        |> put_status(200)
        |> render(json_name, cars: result)
      "car.json" ->
        conn
        |> put_status(200)
        |> render(json_name, car: result)
    end
  end
end
