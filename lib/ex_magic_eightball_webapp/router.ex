defmodule ExMagicEightballWebapp.Router do
  use Plug.Router

  plug Plug.Static,
    at: "/public",
    from: :ex_magic_eightball_webapp

  require EEx

  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  plug :match
  plug :dispatch

  
  # Precompile template
  EEx.function_from_file :defp, :main, "lib/web/main.html.eex" 
  
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

