defmodule Github do
  def org_url(org_name) when is_bitstring(org_name), do: "https://api.github.com/orgs/#{org_name}?access_token=22ba634a0d3280f10c9245b6eb49b5800f6b3b29"
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name), do: "https://api.github.com/repos/#{owner_name}/#{repo_name}?access_token=22ba634a0d3280f10c9245b6eb49b5800f6b3b29"

  def org(org_name), do: json_data(org_url(org_name))
  def repo(owner_name, repo_name), do: json_data(repo_url(owner_name, repo_name))

  defp json_data(url) do
    %{body: body_string, status_code: status} = HTTPoison.get!(url);
    body_json = Poison.decode!(body_string)
    handle_json_response(status, body_json)
  end

  defp handle_json_response(200, data), do: {:ok, data}
  defp handle_json_response(status, data), do: {:error, data}
end