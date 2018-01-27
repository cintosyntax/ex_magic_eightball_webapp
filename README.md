# ExMagicEightballWebapp
[![Build Status](https://travis-ci.org/cintosyntax/ex_magic_eightball_webapp.svg?branch=master)](https://travis-ci.org/cintosyntax/ex_magic_eightball_webapp)

A magic 8-Ball web application built using Elixir. This application leverages the 
[cowboy](https://github.com/ninenines/cowboy) and [plug](https://github.com/elixir-plug/plug).

Deployed on heroku @ https://eightballmagic.herokuapp.com/ 

 
## Installation

Run this bash script
```bash
bin/setup
```

## Starting

Run the application on default port (5000)
```bash
mix run --no-halt
```

## Testing

Single test run
```bash
mix test
```

Run tests on file changes using [ex_guard](https://github.com/slashmili/ex_guard)
```bash
mix guard
```
