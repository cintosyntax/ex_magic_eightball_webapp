defmodule ExMagicEightballWebapp.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest ExMagicEightballWebapp.Router

  test "returns a answer at /answers" do
    conn = conn(:get, "answers")
    conn = ExMagicEightballWebapp.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 200
    assert String.match?(conn.resp_body, ~r/Magic Eight Ball says: /)
  end

  test "returns 404 on unknown path" do
    conn = conn(:get, "/unkowwwwwwn-path")

    conn = ExMagicEightballWebapp.Router.call(conn, [])

    assert conn.state == :sent
    assert conn.status == 404
    assert String.match?(conn.resp_body, ~r/Couldn't find that page, sorry!/)
  end
  
  
end
