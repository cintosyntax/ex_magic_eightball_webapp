use ExGuard.Config

guard("unit-test")
|> command("mix test --color --no-start")
|> watch(~r{\.(erl|ex|exs|eex|xrl|yrl)\z}i)
|> ignore(~r{deps})
|> notification(:auto)