defmodule GigalixirGettingStartedWeb.PageController do
  use GigalixirGettingStartedWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
