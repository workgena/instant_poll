defmodule InstantPoll.Polls.Poll do
  use Ecto.Schema
  import Ecto.Changeset
  alias InstantPoll.Polls.Poll


  schema "polls" do
    field :archived, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Poll{} = poll, attrs) do
    poll
    |> cast(attrs, [:name, :archived])
    |> validate_required([:name, :archived])
  end
end
