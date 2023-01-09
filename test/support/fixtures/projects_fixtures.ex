defmodule ProjectSnowflake.ProjectsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProjectSnowflake.Projects` context.
  """

  @doc """
  Generate a project_info.
  """
  def project_info_fixture(attrs \\ %{}) do
    {:ok, project_info} =
      attrs
      |> Enum.into(%{
        expected_word_count: 9001,
        genre: "Comedy",
        target_reader: "Kindergarten kids with a dream of becoming a hairy wizard when they grow up",
        title: "Barry Trotter"
      })
      |> ProjectSnowflake.Projects.create_project_info()

    project_info
  end
end
