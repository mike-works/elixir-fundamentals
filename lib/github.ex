# ORG:  https://api.github.com/orgs/elixir-lang
# REPO: https://api.github.com/repos/elixir-lang/plug

defmodule Github do
  import HTTPoison, only: [get: 1]
  import Poison, only: [decode!: 1]

  @github_token Application.get_env(:elixir_fundamentals, :github_token)

  def org_url(org_name) when is_bitstring(org_name) do
    "https://api.github.com/orgs/#{org_name}?access_token=#{@github_token}"
  end
  def repo_url(owner_name, repo_name) when is_bitstring(owner_name) and is_bitstring(repo_name) do
    "https://api.github.com/repos/#{owner_name}/#{repo_name}?access_token=#{@github_token}"
  end

  def org(org_name) do
    http_result = get(org_url(org_name))
    process_response(http_result)
  end

  def org!(org_name) do
    {:ok, result} = org(org_name)
    result
  end

  def repo(owner_name, repo_name) do
    http_result = get(repo_url(owner_name, repo_name))
    process_response(http_result)
  end
  ## Successful http response (ONLY-200)
  defp process_response({:ok, %{status_code: 200, body: response_body } }) do
    {:ok, decode!(response_body) } # implicit return
  end
  
  ## Successful http response (non-200)
  defp process_response({:ok, %{body: response_body} }) do
    {:error, decode!(response_body) } # implicit return
  end

  ## Unsuccessful http response
  defp process_response(_) do
    {:error, "WTF"}  
  end
end