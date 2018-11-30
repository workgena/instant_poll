# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :instant_poll,
  ecto_repos: [InstantPoll.Repo]

# Configures the endpoint
config :instant_poll, InstantPollWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YbvTQa/w6m9GwiFuVEp76H8MgaXGqh0G/1aMI+3w+QEqMM9Emilm3OKhEWPOXnfc",
  render_errors: [view: InstantPollWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InstantPoll.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
