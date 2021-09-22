# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hospital,
  ecto_repos: [Hospital.Repo]

# Configures the endpoint
config :hospital, HospitalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6tXEal2Tljs2Q+NdjO1qCZs2a/Urt8WkTKI1XsKpjYyFSIQY/9UryC3u1RAlzOlh",
  render_errors: [view: HospitalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hospital.PubSub,
  live_view: [signing_salt: "bEx103Ux"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
