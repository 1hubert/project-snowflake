defmodule ProjectSnowflake.Repo do
  use Ecto.Repo,
    otp_app: :project_snowflake,
    adapter: Ecto.Adapters.Postgres
end
