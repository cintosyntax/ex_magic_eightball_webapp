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
    import Supervisor.Spec, warn: false

    children = [
      worker(ExMagicEightballWebapp.Router, [])
    ]

    opts = [strategy: :one_for_one]
    Supervisor.start_link(children, opts)
  end

end
