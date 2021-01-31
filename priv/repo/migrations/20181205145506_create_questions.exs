defmodule InstantPoll.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :name, :string, null: false
      add :multiple, :boolean, default: false, null: false
      add :answers, {:array, :string}
      add :other_answer, :boolean, default: false, null: false
      add :poll_id, references(:polls, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:questions, [:poll_id])

    alter table(:polls) do
      add :active_question_id, references(:questions, on_delete: :nilify_all)
    end
  end
end
