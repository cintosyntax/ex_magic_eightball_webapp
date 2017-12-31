defmodule ExMagicEightballWebapp do
  use Application
  @moduledoc """
  Initialization file for ExMagicEightballWebapp that handles starting the HTTP
  server and hooking up the application module to the port provided.
  """

  @doc """
  Init function that runs on application start.
  """
  def start(_type, _args) do
    {:ok, _} = Plug.Adapters.Cowboy.http(ExMagicEightballWebapp.Router, [])
  end
  
end