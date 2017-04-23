defmodule GithubTest do
  use ExUnit.Case
  @moduletag :exercise3

  test "org URL building is done properly for string org names" do
    assert Github.org_url("jquery") === "https://api.github.com/orgs/jquery"
  end

  test "org URL building is guarded against (is_bitstring) for non-string org names" do
    assert_raise(FunctionClauseError, fn ->
      Github.org_url(0)
    end)
  end

  test "repo URL building is done properly for string owner and repo names" do
    assert Github.repo_url("mike-north", "elixir-fundamentals-workshop") === "https://api.github.com/repos/mike-north/elixir-fundamentals-workshop"
  end

  test "repo URL building is guarded against for non-string org and repo names" do
    assert_raise(FunctionClauseError, fn ->
      Github.repo_url("mike-north", 6)
    end)
    assert_raise(FunctionClauseError, fn ->
      Github.repo_url(6, "elixir-fundamentals-workshop")
    end)
  end

  test "org(\"jquery\") data fetching returns a tuple (size 2) with :ok as first item" do
    jquery_org_result = Github.org("jquery")
    assert is_tuple(jquery_org_result) === true
    {jquery_status, _} = jquery_org_result
    assert jquery_status === :ok
  end
  
  test "org(\"jquerrrrrry\") data fetching returns a tuple (size: 2) with :error as first item" do
    jquerrrrrry_org_result = Github.org("jquery")
    assert is_tuple(jquerrrrrry_org_result) === true
    {jquerrrrrry_status, _} = Github.org("jquerrrrrry")
    assert jquerrrrrry_status === :error
  end

  test "org() guards against non-string org names" do
    assert_raise(FunctionClauseError, fn ->
      Github.org(0)
    end)
  end


  test "repo(\"mike-north\", \"elixir-fundamentals-workshop\") returns a tuple, with :ok as first item" do
    repo_result = Github.repo("mike-north", "elixir-fundamentals-workshop")
    assert is_tuple(repo_result)
    {workshop_status, _body} = repo_result
    assert workshop_status === :ok
  end

  test "repo(\"mike-north\", \"elixxxxir-fundamentals-workshop\") returns a tuple, with :error as first item" do
    repo_result = Github.repo("mike-north", "elixxxxir-fundamentals-workshop")
    assert is_tuple(repo_result)
    {bad_status, _body} = repo_result
    assert bad_status === :error
  end

  test "repo() guards against non-string org and repo names" do

    assert_raise(FunctionClauseError, fn ->
      Github.repo("mike-north", 6)
    end)
    assert_raise(FunctionClauseError, fn ->
      Github.repo(6, "elixir-fundamentals-workshop")
    end)
  end
end
