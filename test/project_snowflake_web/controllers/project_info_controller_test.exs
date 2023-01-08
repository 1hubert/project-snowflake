defmodule ProjectSnowflakeWeb.ProjectInfoControllerTest do
  use ProjectSnowflakeWeb.ConnCase

  import ProjectSnowflake.ProjectsFixtures

  @create_attrs %{expected_word_count: 42, genre: "some genre", target_reader: "some target_reader", title: "some title"}
  @update_attrs %{expected_word_count: 43, genre: "some updated genre", target_reader: "some updated target_reader", title: "some updated title"}
  @invalid_attrs %{expected_word_count: nil, genre: nil, target_reader: nil, title: nil}

  describe "index" do
    test "lists all project_infos", %{conn: conn} do
      conn = get(conn, Routes.project_info_path(conn, :index))
      assert html_response(conn, 200) =~ "Your Book Projects"
    end
  end

  describe "new project_info" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.project_info_path(conn, :new))
      assert html_response(conn, 200) =~ "New Project"
    end
  end

  describe "create project_info" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.project_info_path(conn, :create), project_info: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.project_info_path(conn, :show, id)

      conn = get(conn, Routes.project_info_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Project info"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.project_info_path(conn, :create), project_info: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Project"
    end
  end

  describe "edit project_info" do
    setup [:create_project_info]

    test "renders form for editing chosen project_info", %{conn: conn, project_info: project_info} do
      conn = get(conn, Routes.project_info_path(conn, :edit, project_info))
      assert html_response(conn, 200) =~ "Edit Project info"
    end
  end

  describe "update project_info" do
    setup [:create_project_info]

    test "redirects when data is valid", %{conn: conn, project_info: project_info} do
      conn = put(conn, Routes.project_info_path(conn, :update, project_info), project_info: @update_attrs)
      assert redirected_to(conn) == Routes.project_info_path(conn, :show, project_info)

      conn = get(conn, Routes.project_info_path(conn, :show, project_info))
      assert html_response(conn, 200) =~ "some updated genre"
    end

    test "renders errors when data is invalid", %{conn: conn, project_info: project_info} do
      conn = put(conn, Routes.project_info_path(conn, :update, project_info), project_info: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Project info"
    end
  end

  describe "delete project_info" do
    setup [:create_project_info]

    test "deletes chosen project_info", %{conn: conn, project_info: project_info} do
      conn = delete(conn, Routes.project_info_path(conn, :delete, project_info))
      assert redirected_to(conn) == Routes.project_info_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_info_path(conn, :show, project_info))
      end
    end
  end

  defp create_project_info(_) do
    project_info = project_info_fixture()
    %{project_info: project_info}
  end
end
