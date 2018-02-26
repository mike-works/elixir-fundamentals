
# ORG:  https://api.github.com/orgs/elixir-lang
# REPO: https://api.github.com/repos/elixir-lang/plug
defmodule Github do
  def org_url(org_name) when is_bitstring(org_name), do: "https://api.github.com/orgs/#{org_name}?access_token=47bd85eb824ee7f99ee82a7dd46bac777abb230a"
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name) , do: "https://api.github.com/repos/#{owner_name}/#{repo_name}?access_token=47bd85eb824ee7f99ee82a7dd46bac777abb230a"
  def org(org_name) do
    return_response HTTPoison.get!(org_url(org_name))
  end
  def repo(owner_name, repo_name) do
    return_response HTTPoison.get!(repo_url(owner_name, repo_name))
  end
  defp return_response(%{body: _body, status_code: status_code}) when status_code === 404 do
    {:error, "Not Found"}
  end
 
  defp return_response(%{body: _body, status_code: status_code}) when status_code >= 500 do
  end
  defp return_response(%{body: _body, status_code: status_code}) when status_code >= 400 do
    {:error, []}
  end
  defp return_response(%{body: body, status_code: _status_code}) do
    {:ok, Poison.decode(body) }
  end
  defp return_response(resp) do
    {:error, " I have no idea what you passed me #{resp}"}
  end
end
