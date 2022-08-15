defmodule BptrackerWeb.PageController do
  use BptrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
