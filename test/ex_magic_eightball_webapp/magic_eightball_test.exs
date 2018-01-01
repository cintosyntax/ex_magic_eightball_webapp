defmodule ExMagicEightballWebapp.MagicEightballTest do
  use ExUnit.Case, async: true
  doctest ExMagicEightballWebapp.MagicEightball

  test "get answers returns a valid response" do
    question = "This question doesn't matter right?"
    answer = ExMagicEightballWebapp.MagicEightball.get_answer(question)
    
    assert Enum.member?(ExMagicEightballWebapp.MagicEightball.responses, answer) 
  end
  
end
