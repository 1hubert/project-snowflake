defmodule ProjectSnowflake.ProjectsTest do
  use ProjectSnowflake.DataCase

  alias ProjectSnowflake.Projects

  describe "project_infos" do
    alias ProjectSnowflake.Projects.ProjectInfo

    import ProjectSnowflake.ProjectsFixtures

    @invalid_attrs %{expected_word_count: nil, genre: nil, target_reader: nil, title: nil}

    test "list_project_infos/0 returns all project_infos" do
      project_info = project_info_fixture()
      assert Projects.list_project_infos() == [project_info]
    end

    test "get_project_info!/1 returns the project_info with given id" do
      project_info = project_info_fixture()
      assert Projects.get_project_info!(project_info.id) == project_info
    end

    test "create_project_info/1 with valid data creates a project_info" do
      valid_attrs = %{expected_word_count: 9001, genre: "Comedy", target_reader: "Kindergarten kids with a dream of becoming a hairy wizard when they grow up", title: "Barry Trotter"}

      assert {:ok, %ProjectInfo{} = project_info} = Projects.create_project_info(valid_attrs)
      assert project_info.expected_word_count == 9001
      assert project_info.genre == "Comedy"
      assert project_info.target_reader == "Kindergarten kids with a dream of becoming a hairy wizard when they grow up"
      assert project_info.title == "Barry Trotter"
    end

    test "create_project_info/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project_info(@invalid_attrs)
    end

    test "update_project_info/2 with valid data updates the project_info" do
      project_info = project_info_fixture()
      update_attrs = %{expected_word_count: 9002, genre: "Fantasy", target_reader: "Vintage camera enthusiasts", title: "In search of Bigfoot"}

      assert {:ok, %ProjectInfo{} = project_info} = Projects.update_project_info(project_info, update_attrs)
      assert project_info.expected_word_count == 9002
      assert project_info.genre == "Fantasy"
      assert project_info.target_reader == "Vintage camera enthusiasts"
      assert project_info.title == "In search of Bigfoot"
    end

    test "update_project_info/2 with invalid data returns error changeset" do
      project_info = project_info_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project_info(project_info, @invalid_attrs)
      assert project_info == Projects.get_project_info!(project_info.id)
    end

    test "delete_project_info/1 deletes the project_info" do
      project_info = project_info_fixture()
      assert {:ok, %ProjectInfo{}} = Projects.delete_project_info(project_info)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project_info!(project_info.id) end
    end

    test "change_project_info/1 returns a project_info changeset" do
      project_info = project_info_fixture()
      assert %Ecto.Changeset{} = Projects.change_project_info(project_info)
    end
  end
end
