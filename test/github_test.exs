defmodule GithubTest do
  use ExUnit.Case

  test "org URL building is done properly" do
    assert Github.org_url("jquery") === "https://api.github.com/orgs/jquery"
    
    assert_raise(FunctionClauseError, fn ->
      Github.org_url(0)
    end)
  end

  test "repo URL building is done properly" do
    assert Github.repo_url("mike-north", "elixir-fundamentals-workshop") === "https://api.github.com/repos/mike-north/elixir-fundamentals-workshop"
    
    assert_raise(FunctionClauseError, fn ->
      Github.repo_url("mike-north", 6)
    end)
    assert_raise(FunctionClauseError, fn ->
      Github.repo_url(6, "elixir-fundamentals-workshop")
    end)
  end

  test "org data fetching is done properly" do
    {jquery_status, _} = Github.org("jquery")
    assert jquery_status === :ok

    {jquerrrrrry_status, _} = Github.org("jquerrrrrry")
    assert jquerrrrrry_status === :error

    assert_raise(FunctionClauseError, fn ->
      Github.org(0)
    end)
  end
  
  test "repo data fetching is done properly" do
    good_repo_result = Github.repo("mike-north", "elixir-fundamentals-workshop")
    assert is_tuple(good_repo_result)
    {workshop_status, _body} = good_repo_result
    assert workshop_status === :ok

    bad_repo_result = Github.repo("mike-north", "elixxxxir-fundamentals-workshop")
    assert is_tuple(bad_repo_result)
    {bad_status, _body} = bad_repo_result
    assert bad_status === :error

    assert_raise(FunctionClauseError, fn ->
      Github.repo("mike-north", 6)
    end)
    assert_raise(FunctionClauseError, fn ->
      Github.repo(6, "elixir-fundamentals-workshop")
    end)
  end
end
