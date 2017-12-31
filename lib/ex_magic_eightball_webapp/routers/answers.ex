defmodule ExMagicEightballWebapp.Routers.Answers do
  use PlugRouter

  def route("GET", ["answers" | _path], conn) do
    conn |> Plug.Conn.send_resp(200, "You asked for an answer")
  end

end
  