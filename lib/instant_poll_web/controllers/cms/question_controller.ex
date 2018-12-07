defmodule InstantPollWeb.CMS.QuestionController do
  use InstantPollWeb, :controller

  alias InstantPoll.Polls
  alias InstantPoll.Polls.Poll
  alias InstantPoll.Polls.Question

  def new(conn, %{"poll_id" => poll_id}) do
    poll = Polls.get_poll!(poll_id)
    changeset = Question.changeset(%Question{}, %{})

    render(conn, "new.html", changeset: changeset, poll: poll)
  end

  def create(conn, %{"poll_id" => poll_id, "question" => question_params}) do
    case Polls.create_question(poll_id, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Poll created successfully.")
        |> redirect(to: cms_poll_path(conn, :show, poll_id))
      # {:error, %Ecto.Changeset{} = changeset} ->
      #   conn
      #   |> put_flash(:error, "Incorrect name.")
      #   |> redirect(to: cms_poll_path(conn, :index))
      # fix error handling
    end
  end
end
