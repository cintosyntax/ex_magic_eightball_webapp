defmodule ExMagicEightballWebapp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_magic_eightball_webapp,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
     {:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"},
     {:poison, "~> 3.1"},
     {:ex_guard, "~> 1.3", only: :dev},
     {:remix, "~> 0.0.1", only: :dev}
    ]
  end

  def application do
    [
      extra_applications: applications(Mix.env),
      mod: {ExMagicEightballWebapp, []}
    ]
  end
  
  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_all), do: [:logger, :cowboy, :plug]

end

