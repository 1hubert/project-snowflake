defmodule ProjectSnowflake.Repo.Migrations.CreateProjectInfos do
  use Ecto.Migration

  def change do
    create table(:project_infos) do
      add :title, :string
      add :genre, :string
      add :expected_word_count, :integer
      add :target_reader, :string

      timestamps()
    end
  end
end
