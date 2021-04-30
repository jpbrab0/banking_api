defmodule BankingApi.Application do
  use Application

  def start(_type, _args) do
    children = [
      BankingApi.Repo,
      BankingApiWeb.Telemetry,
      {Phoenix.PubSub, name: BankingApi.PubSub},
      BankingApiWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: BankingApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    BankingApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
