defmodule InstantPollWeb.PollController do
  use InstantPollWeb, :controller

  alias InstantPoll.Polls
  alias InstantPoll.Polls.Poll

  def index(conn, _params) do
    polls = Polls.list_polls()
    render(conn, "index.html", polls: polls)
  end

  def show(conn, %{"id" => id}) do
    poll = Polls.get_poll!(id)
    render(conn, "show.html", poll: poll)
  end
end
