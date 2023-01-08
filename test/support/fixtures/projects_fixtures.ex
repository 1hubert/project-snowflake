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
        expected_word_count: 42,
        genre: "some genre",
        target_reader: "some target_reader",
        title: "some title"
      })
      |> ProjectSnowflake.Projects.create_project_info()

    project_info
  end
end
