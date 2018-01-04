defmodule ExMagicEightballWebapp do
  use Application

  import Supervisor.Spec, warn: false  
  @moduledoc """
  Initialization file for ExMagicEightballWebapp that handles starting the HTTP
  server and hooking up the application module to the port provided.
  """

  @doc """
  Init function that runs on application start.
  """
  def start(_type, _args) do
    IO.puts("STARTING")
    
    opts = [strategy: :one_for_one]
    Supervisor.start_link(children(), opts)
  end

  @doc """
  Dynamically set the children processes to start on application start. It should
  not enable the router for Mix.env == :test
  """
  def children() do
    serve_http = Application.get_env(:ex_magic_eightball_webapp, :serve_http, false)
    case serve_http do
      false -> []
      true -> [
        worker(ExMagicEightballWebapp.Router, [])
      ]
    end
  end

end
