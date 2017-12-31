defmodule ExMagicEightballWebappTest do
  use ExUnit.Case
  doctest ExEightBallWebapp

  test "greets the world" do
    assert ExEightBallWebapp.hello() == :world
  end
end
