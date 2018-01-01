defmodule ExMagicEightballWebapp.Router do
  use Plug.Router

  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  plug :match
  plug :dispatch

  get "/answers" do

    answer = ExMagicEightballWebapp.MagicEightball.get_answer("random question")
    Poison.encode!(%{answer: answer}) |> IO.puts

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{answer: answer}))
  end

  match _ do
    send_resp(conn, 404, "Couldn't find that page, sorry!")
  end
end
