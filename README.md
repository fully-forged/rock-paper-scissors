# RockPaperScissors

To start, clone the repo and `git checkout starter`

Then:

  1. Install dependencies with `mix deps.get`
  2. Configure your postgres user in your database files in config/[dev|test].exs 
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Install js dependencies with `npm install`
  5. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Checklist

- [x] Start a new game
- [x] Get list of running games
- [x] Join a game
- [x] Make a move
- [x] Calculate winner
- [x] Log game events
- [x] Pipe game events to Phoenix

## Additional features

- [ ] Tracking score
- [ ] Prevent cheating

## Tutorial

Shows commits and descriptions since the `starter` tag.

    git log --pretty=format:'%Cgreen%h - %Cred%s%Creset%n%b' --reverse starter..HEAD
