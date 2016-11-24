defmodule App.PageController do
  use App.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", layout: {App.LayoutView, "app.html"}
  end
end
