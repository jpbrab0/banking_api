import Config

config :banking_api,
  ecto_repos: [BankingApi.Repo],
  generators: [binary_id: true]

config :banking_api, BankingApi.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :banking_api, BankingApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jbJY6hW36IRVaQ8TqJ066VWq7SJw36RXxcNmKNcUNO+/02FZeIrQMRCfTn7UGuYl",
  render_errors: [view: BankingApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: BankingApi.PubSub,
  live_view: [signing_salt: "4Zf0zQOv"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
