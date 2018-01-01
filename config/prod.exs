port = case System.get_env("PORT") do
  port when is_binary(port) -> String.to_integer(port)
  nil -> 80 # default port
end

config :ex_magic_eightball_webapp, port: port
