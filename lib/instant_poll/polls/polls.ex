defmodule InstantPoll.Polls do

  import Ecto.Query, warn: false
  alias InstantPoll.Repo

  alias InstantPoll.Polls.Poll
  alias InstantPoll.Polls.Question

  def list_polls do
    Poll
    |> order_by(desc: :id)
    |> Repo.all
  end

  def get_poll!(id), do: Repo.get!(Poll, id)

  def create_poll(attrs \\ %{}) do
    %Poll{}
    |> Poll.changeset(attrs)
    |> Repo.insert()
  end

  def update_poll(%Poll{} = poll, attrs) do
    poll
    |> Poll.changeset(attrs)
    |> Repo.update()
  end

  def delete_poll(%Poll{} = poll) do
    Repo.delete(poll)
  end

  def change_poll(%Poll{} = poll) do
    Poll.changeset(poll, %{})
  end

  def list_questions(poll_id) do
    Question
    |> where(poll_id: ^poll_id)
    |> order_by(asc: :id)
    |> Repo.all
  end

  def change_question(%Question{} = question) do
    Question.changeset(question, %{})
  end

  def create_question(poll_id, attrs \\ %{}) do
    %Question{}
    |> Question.changeset(attrs |> Map.merge(%{"poll_id" => poll_id}))
    |> Repo.insert()
  end

  def get_question!(poll_id, id) do
    Repo.get!(Question, id)
  end

  def update_question(%Question{} = question, attrs) do
    question
    |> Question.changeset(attrs)
    |> Repo.update()
  end

  def delete_question(%Question{} = question) do
    Repo.delete(question)
  end
end
