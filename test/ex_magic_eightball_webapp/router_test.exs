defmodule ExMagicEightballWebapp.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest ExMagicEightballWebapp.Router

  test "returns a answer at /answers" do
    conn = conn(:get, "answers")
    conn = ExMagicEightballWebapp.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 200

    {result, json_body} = Poison.decode(conn.resp_body)
    assert result == :ok
    assert Map.has_key?(json_body, "answer")
    assert Enum.member?(ExMagicEightballWebapp.MagicEightball.responses, json_body["answer"]) 
  end

  test "returns 404 on unknown path" do
    conn = conn(:get, "/unkowwwwwwn-path")

    conn = ExMagicEightballWebapp.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 404
    assert String.match?(conn.resp_body, ~r/Couldn't find that page, sorry!/)
  end
  
  
end
