defmodule InstantPollWeb.CMS.QuestionController do
  use InstantPollWeb, :controller

  alias InstantPoll.Polls
  alias InstantPoll.Polls.Poll
  alias InstantPoll.Polls.Question

  def new(conn, %{"poll_id" => poll_id}) do
    poll = Polls.get_poll!(poll_id)
    question = %Question{}
    changeset = Question.changeset(question, %{})

    render(conn, "new.html", changeset: changeset, poll: poll, question: question)
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

  def edit(conn, %{"poll_id" => poll_id, "id" => id}) do
    poll = Polls.get_poll!(poll_id)
    question = Polls.get_question!(poll_id, id)
    changeset = Polls.change_question(question)

    render(conn, "edit.html", question: question, changeset: changeset, poll: poll)
  end

  def update(conn, %{"poll_id" => poll_id, "id" => id, "question" => question_params}) do
    poll = Polls.get_poll!(poll_id)
    question = Polls.get_question!(poll_id, id)

    case Polls.update_question(question, question_params) do
      {:ok, question} ->
        conn
        |> put_flash(:info, "Question updated successfully.")
        |> redirect(to: cms_poll_path(conn, :show, poll))
      # {:error, %Ecto.Changeset{} = changeset} ->
      #   render(conn, "edit.html", poll: poll, changeset: changeset)
    end
  end

  def delete(conn, %{"poll_id" => poll_id, "id" => id}) do
    poll = Polls.get_poll!(poll_id)
    question = Polls.get_question!(poll_id, id)

    {:ok, _question} = Polls.delete_question(question)

    conn
    |> put_flash(:info, "Question deleted successfully.")
    |> redirect(to: cms_poll_path(conn, :show, poll))
  end
end
