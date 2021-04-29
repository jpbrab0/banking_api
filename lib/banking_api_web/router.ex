defmodule BankingApiWeb.Router do
  use BankingApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BankingApiWeb do
    pipe_through :api

    get "/users/user/:id", UserController, :view_account_balance
    post "/users/user", UserController, :create_user
    post "/users/user/deposit/", AccountController, :make_deposit
    post "/users/user/withdraw/", AccountController, :make_withdraw
    post "/users/user/transaction", AccountController, :make_transaction
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BankingApiWeb.Telemetry
    end
  end
end
