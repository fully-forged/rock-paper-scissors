# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :rock_paper_scissors, RockPaperScissors.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "iSYY4albuPXZUtFDWdgFj4fYdgkFj33FSJor2In6KUrR6VBUtvOUxpm9hf0t+QHO",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: RockPaperScissors.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :rock_paper_scissors,
  ecto_repos: [RockPaperScissors.Repo]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
