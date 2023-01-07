defmodule ProjectSnowflakeWeb.PageController do
  use ProjectSnowflakeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
