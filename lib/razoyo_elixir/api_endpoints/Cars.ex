defmodule RazoyoElixir.ApiEndpointsCars do

  @url "https://dev-test-frontend-werpwe2p3q-uc.a.run.app/cars"

  def get_cars(filter) do
    {:ok, response} = HTTPoison.get(update_url(@url, filter), [], [])
    {:ok, body} = decode_response(response)
    {_, token} = get_token(response.headers)

    %{
      all_makes: body["allMakes"],
      cars: body["cars"],
      token: token
    }
  end

  def get_car(id) do
    {:ok, response} = HTTPoison.get(update_url(@url, nil), [], [])
    {_, token} = get_token(response.headers)

    {:ok, response} =
      HTTPoison.get(
        "#{@url}/#{id}",
        [Authorization: "#{token}", "Content-Type": "application/json"],
        [])

    case decode_response(response) do
      {:ok, body} ->
        body
      {:error, _} ->
        []
    end
  end

  defp update_url(url, ""), do: url
  defp update_url(url, nil), do: url
  defp update_url(url, filter), do: "#{url}?make=#{filter}"

  defp get_token(response_headers), do: Enum.filter(response_headers, fn {header, _} -> header == "your-token" end) |> Enum.at(0)

  defp decode_response(response), do: response.body |> Poison.decode()
end
