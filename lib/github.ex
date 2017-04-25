defmodule Github do

  @api_key  Application.get_env(:elixir_fundamentals, :github_token)
  @api_base Application.get_env(:elixir_fundamentals, :github_api)

  def org_url(org_name) when is_bitstring(org_name), do: "#{@api_base}/orgs/#{org_name}"
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name), do: "#{@api_base}/repos/#{owner_name}/#{repo_name}"

  def org(org_name) do
    org_name
    |> org_url
    |> json_data
  end

  def repo(owner_name, repo_name) do
    owner_name
    |> repo_url(repo_name) # Build the URL
    |> json_data # Return the data
  end

  defp json_data(url) do
    import HTTPoison, only: [get!: 1]
    import Poison, only: [decode!: 1]

    %{body: body_string, status_code: status} = url
    |> get!#([], params: %{access_token: @api_key})

    body_string
    |> decode!
    |> handle_json_response(status)
  end

  defp handle_json_response(data, 200), do: {:ok, data}
  defp handle_json_response(data, status), do: {:error, data}
end