defmodule RuleOfThree.NotepadsTest do
  use RuleOfThree.DataCase

  alias RuleOfThree.Notepads

  describe "notepads" do
    alias RuleOfThree.Notepads.Notepad

    import RuleOfThree.{NotepadsFixtures, AccountsFixtures}

    @invalid_attrs %{name: nil, user: nil, current_page: nil}

    test "list_notepads/0 returns all notepads" do
      notepad = notepad_fixture()
      assert Notepads.list_notepads() == [notepad]
    end

    test "get_notepad!/1 returns the notepad with given id" do
      notepad = notepad_fixture()
      assert Notepads.get_notepad!(notepad.id) == notepad
    end

    test "create_notepad/1 with valid data creates a notepad" do
      valid_attrs = %{name: "some name", user_id: user_fixture().id}

      assert {:ok, %Notepad{} = notepad} = Notepads.create_notepad(valid_attrs)
      assert notepad.name == "some name"
      assert notepad.current_page == 1 
    end

    test "create_notepad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notepads.create_notepad(@invalid_attrs)
    end

    test "update_notepad/2 with valid data updates the notepad" do
      notepad = notepad_fixture()
      update_attrs = %{name: "some updated name", current_page: 43}


      assert {:ok, %Notepad{} = notepad} = Notepads.update_notepad(notepad, update_attrs)
      assert notepad.name == "some updated name"
      assert notepad.current_page == 1
    end

    test "update_notepad/2 with invalid data returns error changeset" do
      notepad = notepad_fixture()
      assert {:error, %Ecto.Changeset{}} = Notepads.update_notepad(notepad, @invalid_attrs)
      assert notepad == Notepads.get_notepad!(notepad.id)
    end

    test "delete_notepad/1 deletes the notepad" do
      notepad = notepad_fixture()
      assert {:ok, %Notepad{}} = Notepads.delete_notepad(notepad)
      assert_raise Ecto.NoResultsError, fn -> Notepads.get_notepad!(notepad.id) end
    end

    test "change_notepad/1 returns a notepad changeset" do
      notepad = notepad_fixture()
      assert %Ecto.Changeset{} = Notepads.change_notepad(notepad)
    end
  end

  describe "pages" do
    alias RuleOfThree.Notepads.Page

    import RuleOfThree.NotepadsFixtures

    @invalid_attrs %{number: nil, max_lines: nil}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Notepads.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Notepads.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{number: 42, notepad_id: notepad_fixture().id, max_lines: 42}

      assert {:ok, %Page{} = page} = Notepads.create_page(valid_attrs)
      assert page.number == 42
      assert page.max_lines == 42
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notepads.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{number: 43, max_lines: 43}

      assert {:ok, %Page{} = page} = Notepads.update_page(page, update_attrs)
      assert page.number == 43
      assert page.max_lines == 43
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Notepads.update_page(page, @invalid_attrs)
      assert page == Notepads.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Notepads.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Notepads.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Notepads.change_page(page)
    end
  end

  describe "lines" do
    alias RuleOfThree.Notepads.Line

    import RuleOfThree.NotepadsFixtures

    @invalid_attrs %{description: nil, completed: nil, page: nil}

    test "list_lines/0 returns all lines" do
      line = line_fixture()
      assert Notepads.list_lines() == [line]
    end

    test "get_line!/1 returns the line with given id" do
      line = line_fixture()
      assert Notepads.get_line!(line.id) == line
    end

    test "create_line/1 with valid data creates a line" do
      valid_attrs = %{description: "some description", page_id: page_fixture().id, completed: true}

      assert {:ok, %Line{} = line} = Notepads.create_line(valid_attrs)
      assert line.description == "some description"
      assert line.completed == true
    end

    test "create_line/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notepads.create_line(@invalid_attrs)
    end

    test "update_line/2 with valid data updates the line" do
      line = line_fixture()
      update_attrs = %{description: "some updated description", completed: false}

      assert {:ok, %Line{} = line} = Notepads.update_line(line, update_attrs)
      assert line.description == "some updated description"
      assert line.completed == false
    end

    test "update_line/2 with invalid data returns error changeset" do
      line = line_fixture()
      assert {:error, %Ecto.Changeset{}} = Notepads.update_line(line, @invalid_attrs)
      assert line == Notepads.get_line!(line.id)
    end

    test "delete_line/1 deletes the line" do
      line = line_fixture()
      assert {:ok, %Line{}} = Notepads.delete_line(line)
      assert_raise Ecto.NoResultsError, fn -> Notepads.get_line!(line.id) end
    end

    test "change_line/1 returns a line changeset" do
      line = line_fixture()
      assert %Ecto.Changeset{} = Notepads.change_line(line)
    end
  end
end
