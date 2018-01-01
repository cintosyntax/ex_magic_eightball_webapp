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
    Supervisor.start_link(children(Mix.env), strategy: :one_for_one)
  end

  def children(:test) do
    []
  end

  def children(_) do
    port = Application.get_env(:ex_magic_eightball_webapp, :port, 5000)

    [
      Plug.Adapters.Cowboy.child_spec(:http, ExMagicEightballWebapp.Router, [], port: port)
    ]
  end
  
end
