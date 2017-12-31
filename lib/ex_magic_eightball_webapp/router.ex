defmodule ExMagicEightballWebapp.Router do
  use Plug.Router
  
  plug :match
  plug :dispatch

  get "/answers" do
    send_resp(conn, 200, "Magic Eight Ball says: ")
  end

  match _ do
    send_resp(conn, 404, "Couldn't find that page, sorry!")
  end
end
