defmodule ProjectSnowflakeWeb.ProjectInfoController do
  use ProjectSnowflakeWeb, :controller

  alias ProjectSnowflake.Projects
  alias ProjectSnowflake.Projects.ProjectInfo

  def index(conn, _params) do
    project_infos = Projects.list_project_infos()
    render(conn, "index.html", project_infos: project_infos)
  end

  def new(conn, _params) do
    changeset = Projects.change_project_info(%ProjectInfo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"project_info" => project_info_params}) do
    case Projects.create_project_info(project_info_params) do
      {:ok, project_info} ->
        conn
        |> put_flash(:info, "Project info created successfully.")
        |> redirect(to: Routes.project_info_path(conn, :show, project_info))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project_info = Projects.get_project_info!(id)
    render(conn, "show.html", project_info: project_info)
  end

  def edit(conn, %{"id" => id}) do
    project_info = Projects.get_project_info!(id)
    changeset = Projects.change_project_info(project_info)
    render(conn, "edit.html", project_info: project_info, changeset: changeset)
  end

  def update(conn, %{"id" => id, "project_info" => project_info_params}) do
    project_info = Projects.get_project_info!(id)

    case Projects.update_project_info(project_info, project_info_params) do
      {:ok, project_info} ->
        conn
        |> put_flash(:info, "Project info updated successfully.")
        |> redirect(to: Routes.project_info_path(conn, :show, project_info))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", project_info: project_info, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_info = Projects.get_project_info!(id)
    {:ok, _project_info} = Projects.delete_project_info(project_info)

    conn
    |> put_flash(:info, "Project info deleted successfully.")
    |> redirect(to: Routes.project_info_path(conn, :index))
  end
end
