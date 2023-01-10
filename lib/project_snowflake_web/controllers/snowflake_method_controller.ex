defmodule ProjectSnowflakeWeb.SnowflakeMethodController do
  use ProjectSnowflakeWeb, :controller

  def step1(conn, _params) do
    render(conn, "step1.html")
  end
end
