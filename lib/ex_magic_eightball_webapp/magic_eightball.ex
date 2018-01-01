defmodule ExMagicEightballWebapp.MagicEightball do

  @doc """
  Defines the standard possible respones given by a Magic Eightball.
  """
  def responses do
    [
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes definitely",
      "You may rely on it",
      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Yes",
      "Signs point to yes",
      "Reply hazy try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again",
      "Don't count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    ]
  end

  @doc """
  Returns a randomly selected response from `responses`
  """
  def get_answer(_question) do
    Enum.random(responses())
  end


end
