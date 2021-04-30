import Config

config :banking_api, BankingApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "banking_api_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :banking_api, BankingApiWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
