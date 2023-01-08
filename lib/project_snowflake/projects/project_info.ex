defmodule ProjectSnowflake.Projects.ProjectInfo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_infos" do
    field :title, :string
    field :genre, :string
    field :expected_word_count, :integer
    field :target_reader, :string

    timestamps()
  end

  @doc false
  def changeset(project_info, attrs) do
    project_info
    |> cast(attrs, [:title, :genre, :expected_word_count, :target_reader])
    |> validate_required([:title, :genre, :expected_word_count, :target_reader])
    |> validate_length(:title, min: 2, max: 300)
    #|> validate_inclusion(:genre, [])
    |> validate_number(:expected_word_count, greater_than: 9_000, less_than: 10_000_000)
    |> validate_length(:target_reader, min: 2, max: 300)
  end
end
