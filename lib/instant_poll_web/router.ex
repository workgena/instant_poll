defmodule InstantPollWeb.Router do
  use InstantPollWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InstantPollWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PollController, :index
    get "/:id", PollController, :show
  end

  scope "/manage", InstantPollWeb.CMS, as: :cms do
    pipe_through :browser

    resources "/polls", PollController
  end
end
