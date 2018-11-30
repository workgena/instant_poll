defmodule InstantPollWeb.PageController do
  use InstantPollWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
