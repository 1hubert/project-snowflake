defmodule ProjectSnowflakeWeb.Router do
  use ProjectSnowflakeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ProjectSnowflakeWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProjectSnowflakeWeb do
    pipe_through :browser

    get "/", ProjectInfoController, :index
    get "/project_infos/:id/edit", ProjectInfoController, :edit
    get "/project_infos/new", ProjectInfoController, :new
    get "/project_infos/:id", ProjectInfoController, :show
    post "/project_infos", ProjectInfoController, :create
    patch "/project_infos/:id", ProjectInfoController, :update
    put "/project_infos/:id", ProjectInfoController, :update
    delete "/project_infos/:id", ProjectInfoController, :delete

    get "/test_project/step1", SnowflakeMethodController, :step1
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProjectSnowflakeWeb do
  #   pipe_through :api
  # end

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
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ProjectSnowflakeWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
