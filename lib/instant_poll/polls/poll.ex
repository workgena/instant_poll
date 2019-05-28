defmodule InstantPoll.Polls.Poll do
  use Ecto.Schema
  import Ecto.Changeset
  alias InstantPoll.Polls.Poll
  alias InstantPoll.Polls.Question


  schema "polls" do
    field :archived, :boolean, default: false
    field :name, :string
    belongs_to :active_question, Question
    has_many :questions, Question

    timestamps()
  end

  def changeset(%Poll{} = poll, attrs) do
    poll
    |> cast(attrs, [:name, :archived])
    |> validate_required([:name, :archived])
  end
end
