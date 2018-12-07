defmodule InstantPoll.Polls.Question do
  use Ecto.Schema
  import Ecto.Changeset
  alias InstantPoll.Polls.Question
  alias InstantPoll.Polls.Poll


  schema "questions" do
    field :answers, {:array, :string}
    field :multiple, :boolean, default: false
    field :name, :string
    field :other_answer, :boolean, default: false
    belongs_to :poll, Poll

    timestamps()
  end

  @doc false
  def changeset(%Question{} = question, attrs) do
    question
    |> cast(attrs, [:name, :poll_id, :multiple, :answers, :other_answer])
    |> put_change(
      :answers,
      attrs["answers"] == nil ||
        Enum.reject(attrs["answers"], fn(s) -> String.length(String.trim s) == 0 end)
    )
    |> validate_required([:name, :poll_id, :multiple, :other_answer])
  end
end
