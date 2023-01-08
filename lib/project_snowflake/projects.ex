defmodule ProjectSnowflake.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias ProjectSnowflake.Repo

  alias ProjectSnowflake.Projects.ProjectInfo

  @doc """
  Returns the list of project_infos.

  ## Examples

      iex> list_project_infos()
      [%ProjectInfo{}, ...]

  """
  def list_project_infos do
    Repo.all(ProjectInfo)
  end

  @doc """
  Gets a single project_info.

  Raises `Ecto.NoResultsError` if the Project info does not exist.

  ## Examples

      iex> get_project_info!(123)
      %ProjectInfo{}

      iex> get_project_info!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_info!(id), do: Repo.get!(ProjectInfo, id)

  @doc """
  Creates a project_info.

  ## Examples

      iex> create_project_info(%{field: value})
      {:ok, %ProjectInfo{}}

      iex> create_project_info(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_info(attrs \\ %{}) do
    %ProjectInfo{}
    |> ProjectInfo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_info.

  ## Examples

      iex> update_project_info(project_info, %{field: new_value})
      {:ok, %ProjectInfo{}}

      iex> update_project_info(project_info, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_info(%ProjectInfo{} = project_info, attrs) do
    project_info
    |> ProjectInfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_info.

  ## Examples

      iex> delete_project_info(project_info)
      {:ok, %ProjectInfo{}}

      iex> delete_project_info(project_info)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_info(%ProjectInfo{} = project_info) do
    Repo.delete(project_info)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_info changes.

  ## Examples

      iex> change_project_info(project_info)
      %Ecto.Changeset{data: %ProjectInfo{}}

  """
  def change_project_info(%ProjectInfo{} = project_info, attrs \\ %{}) do
    ProjectInfo.changeset(project_info, attrs)
  end
end
