defmodule ExMagicEightballWebapp.Router do
  use Plug.Router
  require EEx

  plug Plug.Logger, log: :info
  plug Plug.Static,
    at: "/public",
    from: :ex_magic_eightball_webapp
  plug :match
  plug :dispatch

  # Precompile template into private function
  EEx.function_from_file :defp, :main, "lib/web/main.html.eex"

  def start_link do
    # Fetch the port from the configurations
    port = Application.get_env(:ex_magic_eightball_webapp, :port)
    # Inform user of port web-server is mounted on.
    IO.puts("Starting web-server on port #{port}")
    # Start the HTTP server
    Plug.Adapters.Cowboy.http(__MODULE__, [], port: port)
  end
  
  get "/" do
    page_contents = main()

    conn |> 
      Plug.Conn.put_resp_content_type("text/html") |> 
      Plug.Conn.send_resp(200, page_contents)
  end

  get "/answers" do
    answer = ExMagicEightballWebapp.MagicEightball.get_answer("random question")
    
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{answer: answer}))
  end

  match _ do
    send_resp(conn, 404, "Couldn't find that page, sorry!")
  end
end

