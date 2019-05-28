defmodule InstantPoll.Polls.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias InstantPoll.Polls.Question
  alias InstantPoll.Polls.Poll
  alias InstantPoll.EctoType.StringsList


  schema "questions" do
    field :name, :string
    field :answers, StringsList, default: []
    field :multiple, :boolean, default: false
    field :other_answer, :boolean, default: false
    belongs_to :poll, Poll

    timestamps()
  end

  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:name, :answers, :poll_id, :multiple, :other_answer])
    |> validate_required([:name, :poll_id, :multiple, :other_answer])
  end
end
