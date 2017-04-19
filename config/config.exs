# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ueberauth_coding_example,
  ecto_repos: [UeberauthCodingExample.Repo]

# Configures the endpoint
config :ueberauth_coding_example, UeberauthCodingExample.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4+wlQD7vAEojWGbfIIvgOIin86FO90y/iDeUMCWQWbp+eG44Tb/jwfkuYKjSMbGn",
  render_errors: [view: UeberauthCodingExample.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UeberauthCodingExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
