defmodule ExMagicEightballWebapp.HttpRouter do
  use PlugRouter
  @moduledoc """
  Primary router that routes to sub-routers associated with REST resources.
  """

  @doc """
  Routes all requests for `/answers`
  """
  @answers_router_options ExMagicEightballWebapp.Routers.Answers.init([])
  def route("GET", ["answers" | _path], conn) do
    ExMagicEightballWebapp.Routers.Answers.call(conn, @answers_router_options)
  end

  @doc """
  Routes undefined routes to 404 /w a message.
  """
  def route(_method, _path, conn) do
    conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end
end
